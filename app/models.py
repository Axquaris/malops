from app import db


class Adventurer(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32), index=True, unique=True)
    type = db.Column(db.String(16), index=True) # CLASS
    alignment = db.Column(db.String(16), index=True)  # CLASS
    xp = db.Column(db.Integer, index=True)

    max_hp = db.Column(db.Integer, index=True)
    current_hp = db.Column(db.Integer, index=True)
    ac = db.Column(db.Integer, index=True)
    speed = db.Column(db.Integer, index=True)

    str = db.Column(db.Integer, index=True)
    dex = db.Column(db.Integer, index=True)
    con = db.Column(db.Integer, index=True)
    int = db.Column(db.Integer, index=True)
    wis = db.Column(db.Integer, index=True)
    cha = db.Column(db.Integer, index=True)

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
