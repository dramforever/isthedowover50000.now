((.price | round) >= 50000) as $is_over
| @html "<!DOCTYPE html>

<meta charset=\"utf-8\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
<link rel=\"stylesheet\" href=\"style.css\">
<meta property=\"og:url\" content=\"https://isthedowover50000.now/\">
<meta property=\"og:type\" content=\"website\">
<meta property=\"og:title\" content=\"The Dow is \(if $is_over then "over" else "under" end) 50,000\">
<meta property=\"og:description\" content=\"The Dow Jones Industrial Average was at \(.price | round) at \(.updated | strflocaltime("%Y-%m-%d %H:%M"))\">
<title>The Dow is \(if $is_over then "over" else "under" end) 50,000</title>

<div class=\"container \(if $is_over then "result-is-over" else "result-is-under" end)\">
  <div class=\"result\">
    <div class=\"result-prefix\">The Dow is</div>
    <div class=\"result-line\">
      <span class=\"result-main\">\(if $is_over then "Over" else "Under" end)</span>
      <span class=\"result-suffix\">50,000</span>
    </div>
  </div>
  <div class=\"footer\">
    <div>Latest quote: \(.price | round)</div>
    <div>Last updated: <time id=\"last-updated\" datetime=\"\(.updated | todateiso8601)\">\(.updated | strflocaltime("%Y-%m-%d %H:%M")) \(env.TZ)</time></div>
  </div>
</div>
"
