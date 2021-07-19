\version "2.18.2"

\header {
  title = "Devil Siren"
  subtitle = "(Trouble is on the way)"
  composer = "Ivan Gayton"
  tagline = \markup {
    \column {
      "Devil Siren by Ivan Gayton for Mishima Band,"
      "Mishima Mura Iojima, Kagoshima, Japan 2021-07-19"
    }
  }
}

vocal_melody = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  f'2 e8 r r e| d( e) f e4 c a8( | a)  a a r g( a) r a
  c8( b) g c r b a( g) | a2 r |
  c8( b) g c r b a( g) | a2 r |
  r1 |
}

guitar_line = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  \tempo "Allegro" 4 = 115
  a8 \tuplet 3/1 { a d e } g a c a g a
  a,8 \tuplet 3/1 { a d e } g a c a c,4
  a8 \tuplet 3/1 { a d e } g a c a g,16 g gis8
  a d8( e) g a16 a c8 a4 
}

bass_intro = \relative c, {
  \clef bass
  \key a \minor
  \time 4/4
  a8 \tuplet 3/1 { a d e } g a c a g a
  a,8 \tuplet 3/1 { a d e } g a c a c,4
  a8 \tuplet 3/1 { a d e } g a c a g,16 g gis8
  a d8( e) g a16 a c8 a4
}
bass_line = \relative c {
  \clef bass
  \key a \minor
  \time 4/4
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
  e8 e, e'' e,,16 e e' f f f'8 f,16 f' f,
  e8 e, e'' e,,16 e e' f f f'8 f,16 f' f,
  e8 e, e'' e,,16 e e' f f f'8 f,16 f' f,
  g8 g g' g, r g, g' g,
}

text = \lyricmode {
  I know that trouble is on the way 
  you're not ready but
  ready or not you're gonna ride
  ready or not you're gonna ride
}

guitar_comp = \chordmode {
  a1:m a:m a:m a:m e2:m7 f:7+ e:m7 f:7+ e:m f:7+ g1:7
}
\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t % if no change, don't show
      { R1*4 \guitar_comp }
    }
    \new Staff \with {
      instrumentName = "Vocal" shortInstrumentName = "Vx"
      
    } <<
      \set Staff.explicitClefVisibility = #'#(#f #t #t)
      \new Voice = "vox" { \autoBeamOff R1*4 \vocal_melody }
      \new Lyrics \lyricsto "vox" { \text }
    >>
    \new Staff \with {
      instrumentName = "Guit" shortInstrumentName = "Gt"
    } <<
      \new Voice = "guit" { \autoBeamOn \guitar_line \break }
    >>
    
    \new Staff \with {
      instrumentName = "Bass" shortInstrumentName = "Bs"
    } <<
      \new Voice = "bass" { \autoBeamOn \bass_intro \bass_line }
    >> 
  >>
  \layout { 
    \context { \Staff \RemoveEmptyStaves }
    \override Score.TimeSignature.break-visibility = #all-invisible
  }
  \midi { }
}


