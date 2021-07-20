\version "2.18.2"

\header {
  title = "Devil Siren"
  subtitle = "(Trouble is on the way)"
  composer = "Mishima Band"
  tagline = \markup {
    \column {
      "Devil Siren by Ivan Gayton for Mishima Band,"
      "Mishima Mura Iojima, Kagoshima, Japan 2021"
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

% Guitar
line = {
  a8 \tuplet 3/1 { a d e } g a c a g a
  a,8 \tuplet 3/1 { a d e } g a c a c,4
  a8 \tuplet 3/1 { a d e } g a c a g,16 g gis8
  a d8( e) g a16 a c8 a4 
}
guitar_line = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  \tempo "Allegro" 4 = 115
  \line
}
intro_chords = \chordmode {
  a1:m a:m a:m a:m
}
guitar_comp = \chordmode {
  a1:m a:m a:m a:m e2:m7 f:7+ e:m7 f:7+ e:m f:7+ g1:7
}
funkstrum = {
  < a c e a >16 r r < a c e a > r r < a c e a > r r 
  < a c e a > r r < a c e a > r < g c e a > < a c e a >
}
funkclimb = {
  < e b' d g >4 < e b' d g >8 
  \deadNotesOn < e b' d g >16 < e b' d g > 
  < e b' d g > < e b' d g > \deadNotesOff  
  < f c' e a >8 < f c' e a > r
}
guitar_rythm = \relative c'' {
  \funkstrum \funkstrum \funkstrum \funkstrum
  \funkclimb \funkclimb \funkclimb
  < g d' f b >8 r < g d' f b > r 
  < g d' f b > r < g d' f b > r
}

% Bass
aslap = {
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
}
eslap = \relative c {
  e,8 e, e'' e,,16 e'' e, f f f'8 f16 f, f'
}
bass_intro = \relative c, {
  \clef bass
  \key a \minor
  \time 4/4
  \line
}
bass_line = \relative c {
  \clef bass
  \key a \minor
  \time 4/4
  \aslap \aslap \aslap \aslap
  \eslap \eslap \eslap
  g8 g g' g, r g, g' g,
}

text = \lyricmode {
  I know that trouble is on the way 
  you're not ready but
  ready or not you're gonna ride
  ready or not you're gonna ride
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t % if no change, don't show
      { \intro_chords \guitar_comp }
    }
    \new Staff \with {
      instrumentName = "Vocal" shortInstrumentName = "Vx"
    } <<
      \set Staff.explicitClefVisibility = #'#(#f #t #t)
      \new Voice = "vox" { \autoBeamOff R1*4 
                           \repeat volta 2 
                           { \vocal_melody } 
                           \break }
      \new Lyrics \lyricsto "vox" { \text }
    >>
    \new Staff \with {
      instrumentName = "Guit" shortInstrumentName = "Gt"
    } <<
      \new Voice = "guit" { \autoBeamOn 
                            \repeat volta 2 
                            {\guitar_line } 
                            \break 
                            \guitar_rythm }
    >>
    \new Staff \with {
      instrumentName = "Bass" shortInstrumentName = "Bs"
    } <<
      \new Voice = "bass" { \autoBeamOn \bass_intro 
                            \bass_line }
    >> 
  >>
  \layout { 
    \context { \Staff \RemoveEmptyStaves }
    \override Score.TimeSignature.
    break-visibility = #all-invisible
  }
  \midi { }
}


