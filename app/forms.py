from flask_wtf import Form
from wtforms import StringField, BooleanField, IntegerField
from wtforms.validators import DataRequired, NumberRange


class NewAdventurerForm(Form):
    name = StringField('openid', validators=[DataRequired()])
    type = StringField('openid', validators=[DataRequired()])
    xp = IntegerField('openid', validators=[NumberRange(min=0)])
