#!/usr/bin/perl

use v5.14;

print <<HTML;
	<script type="text/javascript">
		\$(document).ready(function () {
			\$('input[name=figure]').change(function () {
				\$('#contRectangleParams').hide();
				\$('#contSquareParams').hide();
				\$('#contCircleParams').hide();
				\$('#contTriangleParams').hide();
				var element = '#'+this.value;
				\$(element).show();
				\$('#submitButton').show();
			});
		});
	</script>
HTML