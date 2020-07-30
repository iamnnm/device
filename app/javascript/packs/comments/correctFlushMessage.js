export default function correctFlushMessage (data) {
    let message = '';

    if(typeof (data) == 'string') {
        message = data;
    } else if(typeof (data) == 'object') {
        for (let key in data) {
            if(key === 'success' || key === 'error' || key === 'notice' || key === 'alert') {
                message = `${data[key]}`;
            } else {
                message = `${key} ${data[key]}`;
            }
        }
    } else {
        message = 'Something went wrong!'
    }

    return message;
}
