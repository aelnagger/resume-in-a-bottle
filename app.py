# The majority of this file is based off a guide by
# Michael Lustfield.
# You can find the original posting at https://michael.lustfield.net/nginx/bottle-uwsgi-nginx-quickstart
from bottle import route, run, template, static_file


# Really we ought to let the server handle this
# but we probably want it for development.
@route('/static/<filename:path>')
def static(filename):
		'''
		Hand out static files.
		'''
		return static_file(filename, rool='./static')

@route('/page/<page_name>')
def show_page(page_name):
	'''
	Return a page which has been rendered
	using a template.
	'''
	return template('page', page_name = page_name)

if __name__ == '__main__':
	run(
		host = '0.0.0.0',
		port = 8080)
