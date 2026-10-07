"""Generator for Will's CVs, rebuilt from the ReportLab layout of the original PDFs.

Usage: python3 cvgen.py quant_trading.py ../Will_McGowan_CV_Quant_Trading.pdf
Needs ReportLab and the Carlito fonts (Debian/Ubuntu package fonts-crosextra-carlito).

Layout facts recovered from the original PDFs: A4, Carlito, frame 1.7 cm left/right and 1.3 cm top
(plus ReportLab's 6 pt frame padding), body leading 1.2 x size, name size + 9, headings size + 0.8 with a
0.6 pt rule, 0.6 pt before each bullet or paragraph, right-hand dates in a box 8 pt wider than the text,
and spacers of 14 / 6 / 4.5 / 7 pt (before a heading / after it / before a sub-entry / between entries)
scaled down by one factor until the page fits.
"""
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import cm
from reportlab.lib.enums import TA_CENTER, TA_RIGHT
from reportlab.lib.colors import black
from reportlab.lib.styles import ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Flowable
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.fonts import addMapping

FONTS = "/usr/share/fonts/truetype/crosextra/"
for name, f in (("Carlito", "Regular"), ("Carlito-Bold", "Bold"), ("Carlito-Italic", "Italic"),
                ("Carlito-BoldItalic", "BoldItalic")):
    pdfmetrics.registerFont(TTFont(name, FONTS + f"Carlito-{f}.ttf"))
addMapping("Carlito", 0, 0, "Carlito"); addMapping("Carlito", 1, 0, "Carlito-Bold")
addMapping("Carlito", 0, 1, "Carlito-Italic"); addMapping("Carlito", 1, 1, "Carlito-BoldItalic")


class Heading(Flowable):
    def __init__(self, text, size):
        super().__init__()
        self.text, self.size = text, size

    def wrap(self, aw, ah):
        self.aw = aw
        return aw, self.size + 4

    def draw(self):
        c = self.canv
        c.setFillColor(black)
        t = c.beginText(0, 4)
        t.setFont("Carlito-Bold", self.size, self.size * 1.2)
        t.textLine(self.text)
        c.drawText(t)
        c.setLineWidth(0.6)
        c.line(0, 1.5, self.aw, 1.5)


class Row(Flowable):
    """Left-hand markup, optional right-aligned text (dates or tools) in a box 8 pt wider than it."""
    def __init__(self, left, right, indent, st):
        super().__init__()
        self.indent = indent
        self.left = Paragraph(left, st["row"])
        self.right = None
        if right:
            italic = right.startswith("<i>")
            plain = right[3:-4] if italic else right
            self.rw = pdfmetrics.stringWidth(plain, "Carlito", st["size"]) + 8
            self.right = Paragraph(right, st["right"])

    def wrap(self, aw, ah):
        self.aw = aw
        if self.right:
            self.right.wrap(self.rw, ah)
        _, h = self.left.wrap(aw - self.indent - (self.rw if self.right else 0), ah)
        return aw, h

    def draw(self):
        self.left.drawOn(self.canv, self.indent, 0)
        if self.right:
            self.right.drawOn(self.canv, self.aw - self.rw, 0)


def styles(size):
    lead = size * 1.2
    body = dict(fontName="Carlito", fontSize=size, leading=lead)
    return {
        "size": size,
        "name": ParagraphStyle("name", fontName="Carlito-Bold", fontSize=size + 9, leading=size + 12, alignment=TA_CENTER),
        "contact": ParagraphStyle("contact", alignment=TA_CENTER, **body),
        "row": ParagraphStyle("row", **body),
        "right": ParagraphStyle("right", alignment=TA_RIGHT, **body),
        "b1": ParagraphStyle("b1", leftIndent=11, bulletIndent=2, spaceBefore=0.6, bulletFontName="Helvetica",
                             bulletFontSize=10, **body),
        "b2": ParagraphStyle("b2", leftIndent=21, bulletIndent=12, spaceBefore=0.6, bulletFontName="Helvetica",
                             bulletFontSize=10, **body),
        "para": ParagraphStyle("para", spaceBefore=0.6, **body),
    }


def story(cv, size, factor):
    st = styles(size)
    out = [Paragraph(cv["name"], st["name"]), Paragraph(cv["contact"], st["contact"])]
    for sec in cv["sections"]:
        out += [Spacer(0, 14 * factor), Heading(sec["title"], size + 0.8), Spacer(0, 6 * factor)]
        for j, e in enumerate(sec.get("entries", [])):
            if j:
                out.append(Spacer(0, 7 * factor))
            out.append(Row(e["left"], e.get("right"), 0, st))
            out += [Row(r, None, 0, st) for r in e.get("rows", [])]
            out += [Paragraph(b, st["b1"], bulletText="•") for b in e.get("bullets", [])]
            for s in e.get("subs", []):
                out += [Spacer(0, 4.5 * factor), Row(s["left"], s.get("right"), 10, st)]
                out += [Row(r, None, 10, st) for r in s.get("rows", [])]
                out += [Paragraph(b, st["b2"], bulletText="•") for b in s.get("bullets", [])]
        out += [Paragraph(p, st["para"]) for p in sec.get("paras", [])]
    return out


class _Bottom(Flowable):
    """Zero-size marker that records where the content ends; draws nothing."""
    def wrap(self, aw, ah):
        return 0, 0

    def drawOn(self, canv, x, y, _sW=0):
        _Bottom.y = y


def build(cv, path, size, factor, bottom_margin=1.0 * cm):
    doc = SimpleDocTemplate(path, pagesize=A4, leftMargin=1.7 * cm, rightMargin=1.7 * cm, topMargin=1.3 * cm,
                            bottomMargin=bottom_margin, title="Will McGowan CV", author="Will McGowan",
                            creator="", producer="")
    pages = []
    doc.build(story(cv, size, factor) + [_Bottom()], onFirstPage=lambda c, d: pages.append(1),
              onLaterPages=lambda c, d: pages.append(1))
    return len(pages), _Bottom.y


SIZES = (10.5, 10.25)
FACTORS = (1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4)
LOWEST_BOTTOM = 41.6  # lowest point (pt from the page bottom) any of the original CVs reaches


def fit(cv, path):
    """Largest font size, then the roomiest spacing, that keeps the CV on one page."""
    for size in SIZES:
        for factor in FACTORS:
            pages, bottom = build(cv, path, size, factor, bottom_margin=0.2 * cm)
            if pages == 1 and bottom >= LOWEST_BOTTOM:
                return size, factor
    raise SystemExit("CV does not fit on one page")


if __name__ == "__main__":
    import importlib.util
    import sys
    spec = importlib.util.spec_from_file_location("content", sys.argv[1])
    content = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(content)
    size, factor = fit(content.CV, sys.argv[2])
    build(content.CV, sys.argv[2], size, factor)
    print(f"{sys.argv[2]}: {size} pt, spacing x{factor}")
