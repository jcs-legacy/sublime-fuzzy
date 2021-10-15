/**
 * $File: dynmod.rs $
 * $Date: 2021-10-15 13:21:28 $
 * $Revision: $
 * $Creator: Jen-Chieh Shen $
 * $Notice: See LICENSE.txt for modification and distribution information
 *                   Copyright © 2021 by Shen, Jen-Chieh $
 */

use emacs::{defun, Env, Result};

use sublime_fuzzy::best_match;

/// Return the PATTERN fuzzy score about SOURCE
///
/// # Arguments
///
/// * `pattern` - Pattern string use to search.
/// * `source` - Target string to match.
#[defun]
fn score(_env: &Env, pattern: String, source: String)
         -> Result<Option<i64>> {
    let result = best_match(&pattern, &source).unwrap()
    Ok(return result.score())
}
