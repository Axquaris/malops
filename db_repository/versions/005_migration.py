from sqlalchemy import *
from migrate import *


from migrate.changeset import schema
pre_meta = MetaData()
post_meta = MetaData()
adventurer = Table('adventurer', post_meta,
    Column('id', Integer, primary_key=True, nullable=False),
    Column('name', String(length=32)),
    Column('type', String(length=16)),
    Column('xp', Integer),
)


def upgrade(migrate_engine):
    # Upgrade operations go here. Don't create your own engine; bind
    # migrate_engine to your metadata
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    post_meta.tables['adventurer'].columns['type'].create()
    post_meta.tables['adventurer'].columns['xp'].create()


def downgrade(migrate_engine):
    # Operations to reverse the above upgrade go here.
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    post_meta.tables['adventurer'].columns['type'].drop()
    post_meta.tables['adventurer'].columns['xp'].drop()
