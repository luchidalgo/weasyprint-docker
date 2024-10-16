from flask import Flask, request, make_response
from weasyprint import HTML

app = Flask(__name__)

@app.route('/health')
def health():
    return 'ok'

@app.route('/pdf', methods=['POST'])
def pdf():
    data = request.get_data(as_text=True)
    html = HTML(string=data)
    pdf = html.write_pdf()
    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline;filename=file.pdf'
    return response

if __name__ == '__main__':
    app.run()