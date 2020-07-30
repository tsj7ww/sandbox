from email.message import EmailMessage
import smtplib
import ssl

def ALERT(pkg,frm,to,svr,port,pwd):
    """
    in: name for email subject, email address, server name
    """
    import datetime
    import random

    sub = 'Job Search Alert'
    intros = [
        'Howdy'
        ,'Happy {DT}'.format(DT=datetime.date.today().strftime('%A'))
        ,'Check out these beatitudes'
    ]
    outros = [
        'Have a great day!','Cheers!','Yeet!'
    ]
    
    header = '<html><head></head><body>{INTRO},<br>'.format(INTRO=intros[random.randint(0,len(intros)-1)])
    footer = '{OUTRO}</body></html>'.format(OUTRO=outros[random.randint(0,len(outros)-1)])
    
    content=''
    for loc,posts in pkg.items():
        content+='<b>{LOC}</b><br><li>'.format(LOC=loc)
        base = '<i><a href="{URL}">{TITLE} at {COMPANY}({RATING})</a>'
        for post in posts:
            content+=base.format(
                URL=post['url_post']
                ,TITLE=post['title']
                ,COMPANY=post['company']
                ,RATING=post['rating']
            )
        content+='</li><br>'
    
    m = {'Subject': sub, 'From': frm, 'To': ','.join(to)}
    msg = EmailMessage()
    
    for k,v in m.items():
        msg[k] = v
    
    body = '<br>'.join([header,content,footer])
    msg.set_content(body, subtype='html')
    
    with smtplib.SMTP(svr,port) as s:
        ctx = ssl.create_default_context()
        s.starttls(context=ctx)
        s.sendmail(frm,to,msg)

def FAIL(info,frm,to,svr,port,pwd):
    """
    in: name for email subject, email address, server name
    """
    sub = 'PROCESS FAILURE: Job Search ETL'
    
    m = {'Subject': sub, 'From': frm, 'To': to}
    msg = EmailMessage()
    
    for k,v in m.items():
        msg[k] = v
    msg.set_content(info, subtype='plain')
    
    #body = 'Log results:\n{LOGGER}'.format(LOGGER='\n'.join(lgr))
    #msg.set_content(body, subtype='text')
    
    with smtplib.SMTP(svr,port) as s:
        ctx = ssl.create_default_context()
        s.starttls(context=ctx)
        s.sendmail(frm,to,msg)