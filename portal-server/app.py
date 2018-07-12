from flask import Flask, render_template, request
from wtforms import Form, StringField, validators
from subprocess import call


app = Flask(__name__)

class HelloForm(Form):
	stack_name = StringField('',[validators.DataRequired()])

def get_stacks():
	lines = []
	try:
		f = open('stacks_deployed.txt', 'r')
		lines = f.readlines()
		f.close()
	except Exception:
		print("no File")
	return lines

def add_stack(stack_to_add):
	current_stacks = get_stacks()
	error = ""
	if ("%s\n" % stack_to_add) not in current_stacks:
		call(["bash", "-c", "cd .. && make deploy STACK_NAME=%s NAMESPACE=%s" % (stack_to_add,stack_to_add) ])
		try:	
			f = open('stacks_deployed.txt', 'a')
			f.write("%s\n" % stack_to_add)
			f.close()
		except Exception:
			print("no File")
			error="Error: state not found"
	else:
		error = "Error: stack already deployed"
	return error




################################### WEB SERVER
@app.route('/')
def index():
	form = HelloForm(request.form)
	current_stacks = get_stacks()
	return render_template('first_app.html', form=form, stacks_deployed=current_stacks)

@app.route('/hello', methods=['POST'])
def hello():
	form = HelloForm(request.form)
	if request.method == 'POST' and form.validate():
		stack_name = request.form['stack_name']
		current_stacks = get_stacks()
		error = add_stack(stack_name)

		
		return render_template('hello.html', stack_name=stack_name, error=error)
	return render_template('first_app.html', form=form)

if __name__ == '__main__':
	app.run(host='0.0.0.0', debug=True)