from weasyprint import CSS
from weasyprint.text.fonts import FontConfiguration

def css_for_extra_fonts():
    font_config = FontConfiguration()
    return CSS(string='''
        @font-face {
            font-family: 'Noto Sans Light Italic';
            src: local('NotoSans-LightItalic');
        }
        ''', font_config=font_config), font_config