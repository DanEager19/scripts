from flask import *
import db

app = Flask(__name__)
db = db.Redis_DB()

@app.route('/')
def home():
    pairs = db.get_all()
    return render_template('base.html', pairs=pairs)    

@app.route('/submit', methods = ['GET', 'POST'])
def submit():
    if request.method == 'POST':
        key = request.form['key']
        value = request.form['value']
        db.setter(key, value)
    return redirect(url_for('home'))
    
@app.route('/delete', methods = ['GET', 'POST'])
def delete():
    if request.method == 'POST':
        key = request.form['key']
        db.delete(key)
    return redirect(url_for('home'))
        
if __name__ == 'main':
    app.run()