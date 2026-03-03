Config = {}

Config.EventRoute = {
	getSharedObject = 'esx:getSharedObject',
}

Config.AutoAnnouce = {
	enable = true,
	timeout = 1,
	duration = 15,
	title = 'ประกาศ :',
	logo = 'img/logo.png',
	sound = {
		file = 'notify.ogg',
		volume = 0.3,
	},
	style = {
		bg_color = 'linear-gradient(90deg, #1E1E1E 0%, #000000 85%, #2970F2 100%)',
		icon_color = 'linear-gradient(0deg, #2049BB 0%, #2970F2 100%)',
		title_color = '#2970F2',
		text_color = '#ffffff',
	},
	list = {
		'ยินดีต้อนรับ ขอให้สนุกกับการสวมบทบาท',
		'ติดตามข่าวสารและกิจกรรมต่างๆ ได้ที่กลุ่มชุมชนของเรา',
		'หากพบผู้กระทำความผิด โปรดแจ้งผู้ดูแลระบบ',
		'ห้ามทวิตเรียกแอดมิน/นายก ในเมือง เด็ดขาด',
		'ผู้เล่นที่ติดคุก ห้ามเข้าร่วมกิจกรรมทุกกิจกรรม',
		'รีประเทศทุกวัน เวลา 12:00 / 18:00 / 00:00',
	},
}

Config.AdminAnnouce = {
	enable = true,
	duration = 15,
	command = 'anm',
	title = 'ประกาศจากแอดมิน : ',
	logo = 'img/logo.png',
	sound = {
		file = 'notify.ogg',
		volume = 0.35,
	},
	style = {
		bg_color = 'rgba(7, 11, 18, 0.97)',
		icon_color = 'rgb(75, 126, 214)',
		title_color = '#ffffff',
		text_color = '#ffffff',
	},
	group = {
		'superadmin',
		'admin',
	},
}
