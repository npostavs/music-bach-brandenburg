\include "notes.ly"

\Amovement
\score{ \transpose bf c { \transpose c f \Atromba } }

% Lilypond defaults lead to a final page with two systems.  There
% doesn't seem to be a lot of help for this.  Since the third movement
% ends up being three pages, it doesn't seem worth worrying much about
% it.

\Cmovement
\score { \transpose bf c { \transpose c f \Ctromba } }
