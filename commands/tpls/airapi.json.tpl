{
  "name": "{{projectName}}",
  "version": "0.1.0",
  "description": "project description",
  "title": "project title",
  "url": "backend url",
  "apiSuccessTemplate": {
    "status": "OK",
    "code": "200",
    "data": "DataObject"
  },
  "apiErrorTemplate": {
		"status": "Error",
		"error_code": "CODE",
		"error_msg": "ERROR_MESSAGE"
	},
	"ErrorCode": {
		"403": "Access denied",
		"2003": "该号码已被注册"
	},
	"CommentQuery": {
		"sort": "排序",
		"limit": "限制返回数量（分页）",
		"skip": "跳过返回数量（分页）"
	}
}
