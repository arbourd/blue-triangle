function getCourses(date){
		console.log(date);
		$.ajax({
			dataType: "json",
			url:"/courses?date="+date,
			success:function(date){
				console.log(date);
			}

		});
}