%module CipheyCore

%include std_basic_string.i
//%include std_string.i
%include std_map.i
%include std_vector.i
%include std_shared_ptr.i

%{
#include <map>
  #define SWIG_FILE_WITH_INIT
  #include "Ciphey/typedefs.hpp"
  #include "Ciphey/swig.hpp"
%}

%include "Ciphey/typedefs.hpp"

namespace std {
  %template(freq_table) map<Ciphey::char_t, Ciphey::freq_t>;
  %template(prob_table) map<Ciphey::char_t, Ciphey::prob_t>;
  %template(group_t) vector<Ciphey::char_t>;
  %template(caesar_key_t) vector<size_t>;
  %template(analysis) shared_ptr<const Ciphey::simple_analysis_res>;
}

%include "Ciphey/candidates.swig.hxx"
%include "Ciphey/swig.hpp"
namespace Ciphey {
  %template(caesar_results_elem) crack_result<Ciphey::caesar::key_t>;
  %template(vigenere_results_elem) crack_result<Ciphey::vigenere::key_t>;
}
namespace std {
  %template(caesar_results) vector<Ciphey::crack_result<Ciphey::caesar::key_t>>;
  %template(vigenere_results) vector<Ciphey::crack_result<Ciphey::vigenere::key_t>>;
}