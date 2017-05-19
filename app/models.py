from app import db


class Adventurer(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32), index=True, unique=True)
    type = db.Column(db.String(16), index=True) # CLASS
    xp = db.Column(db.Integer, index=True)
    gear = db.relationship('Gear', backref='owner', lazy='dynamic')

    def __repr__(self):
        return '<Adventurer %r>' % (self.name)


class Gear(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32), index=True, unique=True)
    description = db.Column(db.String(1024), index=True)
    owner_id = db.Column(db.Integer, db.ForeignKey('adventurer.id'))

    def __repr__(self):
        return '<Gear %r>' % (self.name)
