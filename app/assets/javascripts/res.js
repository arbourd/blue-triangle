/**
 * Created by user on 4/3/2016.
 */
function getDate(year, month, day)
{
    var date = year+"-"+month+"-"+day;
    var select = document.getElementById("selDate");
    select.value = date;
}