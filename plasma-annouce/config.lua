
Config = {}
Config['EventRoute'] = {
	['getSharedObject'] = 'esx:getSharedObject',  -- Default: 'esx:getSharedObject'
}

Config['AutoAnnouce'] = {
	enable = true,  -- เปิด/ปิด ใช้งาน ระบบประกาศข้อความ auto
	timeout = 1,  -- ดีเลย์ในการประกาศข้อความโดยอัตโนมัติ (นาที)
	duration = 15,  -- เวลาในการแสดงข้อความที่ประกาศ (วินาที)
	title = 'ประกาศ :',  -- หัวข้อประกาศข้อความประกาศอัตโนมัติ
	style = {
		bg_color = 'linear-gradient(90deg, #1E1E1E 0%, #000000 85%, #2970F2 100%)',
		icon_color = 'linear-gradient(0deg, #2049BB 0%, #2970F2 100%)',
		title_color = '#2970F2',
		text_color = '#ffffff'
	},
	list = {  -- ข้อความที่ต้องการประกาศโดยอัตโนมัติ
		'ยินดีต้อนรับ ขอให้สนุกกับการสวมบทบาท',
		'ติดตามข่าวสารและกิจกรรมต่างๆ ได้ที่กลุ่มชุมชนของเรา',
		'หากพบผู้กระทำความผิด โปรดแจ้งผู้ดูแลระบบ',
		'ห้ามทวิตเรียกแอดมิน/นายก ในเมือง เด็ดขาด',
		'ผู้เล่นที่ติดคุก ห้ามเข้าร่วมกิจกรรมทุกกิจกรรม',
		'รีประเทศทุกวัน เวลา 12:00 / 18:00 / 00:00'
	}
}

Config['AdminAnnouce'] = {
	enable = true,
	duration = 15,
	command = 'anm',
	title = 'ประกาศจากแอดมิน : ',
	style = {
		bg_color = 'rgba(7, 11, 18, 0.97)',
		icon_color = 'rgb(75, 126, 214)',
		title_color = '#ffffff',
		text_color = '#ffffff'
	},
	group = {
		'superadmin',
		'admin'
	}
}
