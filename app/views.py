from flask import render_template, flash, redirect
from app import app, db, models
from .forms import NewAdventurerForm
from app.static import dnd


@app.route('/')
@app.route('/index')
def index():
    adventurers = models.Adventurer.query.all()
    for a in adventurers:
        a.level = dnd.findlevel(a.xp)
    return render_template('index.html',
                           title='Home',
                           adventurers=adventurers)


@app.route('/newadventurer', methods=['GET', 'POST'])
def newadventurer():
    form = NewAdventurerForm()
    if form.validate_on_submit():
        flash('New %s created: %s, level %s' %
              (form.type.data, form.name.data, str(dnd.findlevel(form.xp.data))))
        db.session.add(models.Adventurer(name = form.name.data, type = form.type.data, xp = form.xp.data))
        db.session.commit()
        return redirect('/index')
    return render_template('newadventurer.html',
                           title='Create Character',
                           form=form)

@app.route('/dungeonmaster')
def dungeonmaster():
    adventurers = models.Adventurer.query.all()
    for a in adventurers:
        a.level = dnd.findlevel(a.xp)
        print(a.level, a.xp)

    return render_template('dungeonmaster.html',
                           title='DM Interface',
                           adventurers=adventurers)

@app.route('/charsheet')
def charsheet():
    adventurer = models.Adventurer.query.first()

    return render_template('charsheet.html',
                           title='Charachter Sheet Test',
                           char=adventurer)