# Introduction

`music_mode` is set of bash functions that make it possible to query my beets database and enqueue music to cmus.

Part of the motivation for `music_mode` is that beets is horrendously slow with larger libraries, and after some brief experimentation is became clear that the python wrapping is the main reason. It's much faster to run queries via `sqlite3`. They are essentially instant with `music_mode`, while `beet` often takes double-digit seconds.

I also have a separate tags database that uses the `beets_id` field to associate tags with tracks. This script combines both databases into a temporary sqlite database (via `mm_refresh_database`) to allow querying by tag.

## Configuration

The paths at the top of `music_mode` are highly specific to my installation. In theory, anyone with a beets database could find this useful. The tags schema is extremely simple and could be mimicked if that feature were desired. And the cmus integration should Just Work™.

## Usage

Usually I start with `mm_refresh_database`.

Use `mm_search`, `mm_title`, `mm_random`, `mm_tagged`, etc. to query the library. By default, the path to the files are printed for each match.

The output format can be changed to:

- `mm_format_table`: table with artist, track, title, album, path columns. It is possible to adjust column widths with `mm_widths 10 20 30 40 50`, where the width of each column is 10 chars, 20 chars, 30 chars, etc.
- `mm_format_playlist`: default. just prints path (suitable for `> playlist.m3u`)
- `mm_format_everything`: prints every single datum for the track, one per row. This is a *ton* of data, and you probably don't want this unless you're searching for a single track.

The results of the last query are always saved. You can use `mm_cmus_enqueue` to add the results of the last query to cmus.

## Not-Usage

`music_mode` is strictly read-only. When I make updates to my beets library, I do it via `beet`. This is still slow, sometimes painfully slow, but since it doesn't happen very often (and I have that automated anyway), I don't have much incentive to run the risk of corrupting my music database to support writing.
