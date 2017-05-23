from sqlalchemy import *
from migrate import *


from migrate.changeset import schema
pre_meta = MetaData()
post_meta = MetaData()
adventurer = Table('adventurer', post_meta,
    Column('id', Integer, primary_key=True, nullable=False),
    Column('name', String(length=32)),
    Column('type', String(length=16)),
    Column('alignment', String(length=16)),
    Column('xp', Integer),
    Column('max_hp', Integer),
    Column('current_hp', Integer),
    Column('ac', Integer),
    Column('speed', Integer),
    Column('str', Integer),
    Column('dex', Integer),
    Column('con', Integer),
    Column('int', Integer),
    Column('wis', Integer),
    Column('cha', Integer),
)


def upgrade(migrate_engine):
    # Upgrade operations go here. Don't create your own engine; bind
    # migrate_engine to your metadata
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    post_meta.tables['adventurer'].columns['ac'].create()
    post_meta.tables['adventurer'].columns['alignment'].create()
    post_meta.tables['adventurer'].columns['cha'].create()
    post_meta.tables['adventurer'].columns['con'].create()
    post_meta.tables['adventurer'].columns['current_hp'].create()
    post_meta.tables['adventurer'].columns['dex'].create()
    post_meta.tables['adventurer'].columns['int'].create()
    post_meta.tables['adventurer'].columns['max_hp'].create()
    post_meta.tables['adventurer'].columns['speed'].create()
    post_meta.tables['adventurer'].columns['str'].create()
    post_meta.tables['adventurer'].columns['wis'].create()


def downgrade(migrate_engine):
    # Operations to reverse the above upgrade go here.
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    post_meta.tables['adventurer'].columns['ac'].drop()
    post_meta.tables['adventurer'].columns['alignment'].drop()
    post_meta.tables['adventurer'].columns['cha'].drop()
    post_meta.tables['adventurer'].columns['con'].drop()
    post_meta.tables['adventurer'].columns['current_hp'].drop()
    post_meta.tables['adventurer'].columns['dex'].drop()
    post_meta.tables['adventurer'].columns['int'].drop()
    post_meta.tables['adventurer'].columns['max_hp'].drop()
    post_meta.tables['adventurer'].columns['speed'].drop()
    post_meta.tables['adventurer'].columns['str'].drop()
    post_meta.tables['adventurer'].columns['wis'].drop()
