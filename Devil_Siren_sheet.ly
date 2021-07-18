\version "2.18.2"
vocal_melody = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  f'2 e8 r r e| d( e) f e( e) c( c) a( | a)  a a r g( a) r a
  c8( b) g c r b a( g) | a2 r |
  c8( b) g c r b a( g) | a2 r |
  r1 |
}

guitar_line = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  a8 \tuplet 3/1 { a d e } g a c a g a
  a,8 \tuplet 3/1 { a d e } g a c a c,4
  a8 \tuplet 3/1 { a d e } g a c a g,16 g gis8
  a d8( e) g a16 a c8 a4 
}

bass_line = \relative c' {
  \clef bass
  \key a \minor
  \time 4/4
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
  
}

text = \lyricmode {
  I know that trouble is on the 
  way you're not ready but
  ready or not you're gonna ride
  ready or not you're gonna ride
}

harmonies = \chordmode {
  a1:m a:m a:m a:m e2:m7 f:7+ e:m7 f:7+ e:m f:7+ g1:7
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "vox" { \autoBeamOff R1*4 \vocal_melody }
    \new Lyrics \lyricsto "vox" \text
    \new Voice = "guit" { \autoBeamOn \guitar_line \break }
    \new Voice = "bass" { \autoBeamOn \bass_line \bass_line \break \bass_line \bass_line }
  >>
  \layout { }
  \midi { }
}
