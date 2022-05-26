import { DAY_OF_WEEK_DATA } from "Helpers/constant";
import { ActiveDay, Day, MonthDataArea, Monthly, StyledCheckInOut, YearMonthArea } from "./Calendar.styled";

interface checkInOutType {
  year: number;
  month: number;
  day: number;
}

interface monthComponentType {
  year: number;
  month: number;
  checkIn: checkInOutType;
  checkOut: checkInOutType;
}

interface dayComponentType {
  year: number;
  month: number;
  day: number;
  checkIn: checkInOutType;
  checkOut: checkInOutType;
}

interface calendarType {
  year: number;
  month: number;
  checkIn: checkInOutType;
  checkOut: checkInOutType;
}

export default function Calendar({ year, month, checkIn, checkOut }: calendarType) {
  const dayOfWeekComponent = DAY_OF_WEEK_DATA.map((day, idx) => <Day key={createKey(day, idx)}>{day}</Day>);
  const monthComponent = getMonthComponent({ year, month, checkIn, checkOut });

  return (
    <Monthly>
      <YearMonthArea flex={true} justify="center">{`${year}년 ${month}월`}</YearMonthArea>
      <MonthDataArea>
        {dayOfWeekComponent}
        {monthComponent}
      </MonthDataArea>
    </Monthly>
  );
}

const getMonthComponent = ({ year, month, checkIn, checkOut }: monthComponentType) => {
  const firstDayDateNumber = calculateDayOfWeekDate(year, month);
  const monthLastDay = getMonthEndDay(year, month);
  const monthData = new Array(firstDayDateNumber).fill(null);
  for (let i = 1; i <= monthLastDay; i++) {
    monthData.push(i);
  }
  return monthData.map((day, idx) => {
    return (
      <Day key={createKey(day, idx)}>
        {day ? createDayComponent({ year, month, day, checkIn, checkOut }) : ""}
      </Day>
    );
  });
};

const calculateDayOfWeekDate = (year: number, month: number, day: number = 1) => {
  const dayOfWeek = new Date(year, --month, day).getDay();
  return dayOfWeek;
};

const createKey = (data: string, idx: number) => {
  return `${data}-${idx}`;
};

const createDayComponent = ({ year, month, day, checkIn, checkOut }: dayComponentType) => {
  if (year === checkIn.year && month === checkIn.month && day === checkIn.day) {
    return (
      <ActiveDay radius="30px 0 0 30px">
        <StyledCheckInOut>{day}</StyledCheckInOut>
      </ActiveDay>
    );
  }
  if (year === checkOut.year && month === checkOut.month && day === checkOut.day) {
    return (
      <ActiveDay radius="0 30px 30px 0">
        <StyledCheckInOut>{day}</StyledCheckInOut>
      </ActiveDay>
    );
  }

  const firstCondition =
    year >= checkIn.year && ((month === checkIn.month && day >= checkIn.day) || month > checkIn.month);
  const secCondition =
    year <= checkOut.year && ((month === checkOut.month && day <= checkOut.day) || month < checkOut.month);
  if (firstCondition && secCondition) {
    return <ActiveDay>{day}</ActiveDay>;
  }
  return day;
};

const getMonthEndDay = (year: number, month: number) => {
  const feb = year % 4 === 0 && (year % 400 === 0 || year % 100 !== 0) ? 29 : 28;
  const [jan, mar, apr, may, jun, jul, aug, sep, oct, nov, dec] = [
    31, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
  ];
  const allMonth = [0, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec];
  return allMonth[month];
};
