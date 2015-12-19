# The majority of this file is based off a guide by
# Michael Lustfield.
# You can find the original posting at https://michael.lustfield.net/nginx/bottle-uwsgi-nginx-quickstart
from bottle import route, run, template, static_file

import sqlite3

def query(query_text):
	con = None;

	try:
		con = sqlite3.connect('resume.db')
		con.row_factory = sqlite3.Row
		cur = con.cursor()
		cur.execute(query_text)
		return cur.fetchall()
	except sqlite3.Error:
		return {}
	finally:
		if con:
			con.close()

def get_person(id = 1):
	return query('select * from person where rowid = %i' % id)[0]

def get_skills(person_id = 1):
	return query('select * from skill where person_id = %i' %person_id)

def get_jobs(id = 1):
	employers = query('select * from employer where rowid = 1')
	positions  = query('select * from position where rowid = 1')
	return query('select * from job')

# Really we ought to let the server handle this
# but we probably want it for development.
@route('/static/<filename:path>')
def static(filename):
		'''
		Hand out static files.
		'''
		return static_file(filename, rool='./static')

@route('/')
def show_resume():
	'''
	Retrieve subsections and render resume.

	The resume is composed of several sections:
		1. Person / Contact information used to generate a header.
		2. Core skills and qualifications
		3. Job history
	'''
	person = get_person()
	skills = get_skills()
	jobs = get_jobs()

	return template('resume',
		person = person,
		skills = skills,
		jobs = jobs)

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
