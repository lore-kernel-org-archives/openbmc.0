Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::229; helo=mail-qt0-x229.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PnK+59YH"; 
 dkim-atps=neutral
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Qx6Z6HNBzF35Y
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 10:05:58 +1000 (AEST)
Received: by mail-qt0-x229.google.com with SMTP id z8-v6so14184150qto.9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 17:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=D+9mK8qcfReP27RpCaS2t3t45Y5VeztV/QXwuOadVAc=;
 b=PnK+59YHTDArj1T8yY8ebHf3yZIXMVfO7TYYQZ8uuOPu9Yd0qZGCqAWKMxc0A6PSNP
 1mGe7fMvXaeVKHvfVGy33a7TNl9K1iH40BCSOXSxpu4mEhZSqR7QldeoNbNnps1YGyds
 qdw3Tstj/2dRQ5fBXdNB/3OaXTojL3NAHMhWExLz8vSAYQHfv9Nq6eupkV1F0SMx83Hh
 qzt5KckdEwFQEgxE79u3NJx9JcoZlvbdNuOvUQ/if7idUsKLmsXzJ6tdmPtNh3SyLW0H
 FBqs4UaLvVokoOtlZ4PYfWzGTjE05b7pUpOYt4f0rJHvwSgsMgnBBbT4HK98JJXJyqTc
 pndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=D+9mK8qcfReP27RpCaS2t3t45Y5VeztV/QXwuOadVAc=;
 b=oHxbYOD0TNGrPM8oaEhYL3lT30pEhXHG7QjEeB842uTKCbCdVJRrrCDOEkr9TbAgLk
 xzoAxmTM7yOOdkyvXDy2qycvYY7Kvzrz0fz3goJF5JOlGVtHTuyZCWHh3D48HYPb7S+p
 vEw9PgjGSSRgC+mlUBSuiGd6CM6T3gMoazQnWJGG7asv9tRBA0O5gQ2Tz/IuNgBUA4FT
 F2HU+5ryDJPJzzVuKTYiIMg77OhO7D9I908YPlP2UZuzYMBye3DvjgdxLL77F10xxjf3
 sWZwXDlpUjDEuLCqI2Uzq+iQkUWs3J0c+uqa5p+pGaqAo0wUFGCdK8RSKXgYp90TkvUy
 aM3A==
X-Gm-Message-State: AOUpUlHDuGGI9WTPHajRa0/Po4htIlO3wZ7swThAeiSLMuB874BiBsN1
 PSr9lFR8ZGtW7BPwX625MoAcNiW9EjfTwPCXfdw0OQ==
X-Google-Smtp-Source: AAOMgpc1oeEf0+h6VJ1DmK79uVdVgudnn9irr/7i8jzGptNsgC1NELWBI/iZTPaiWBWgZr8qHgpBWi37vDnXQGDqrdo=
X-Received: by 2002:a0c:b3d4:: with SMTP id
 b20-v6mr824789qvf.141.1531353954842; 
 Wed, 11 Jul 2018 17:05:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 17:05:54
 -0700 (PDT)
In-Reply-To: <ab6d15cb-f965-3211-fbaa-6a734bf6eb70@linux.vnet.ibm.com>
References: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
 <ab6d15cb-f965-3211-fbaa-6a734bf6eb70@linux.vnet.ibm.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Thu, 12 Jul 2018 08:05:54 +0800
Message-ID: <CAG9c7cARHXbG2tByEjOONxmhy+wqsTLs-PuYk08qn-aFRN1fdw@mail.gmail.com>
Subject: Re: IPMI and Redfish support in openbmc Linux
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000080fae90570c2204d"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 00:06:00 -0000

--00000000000080fae90570c2204d
Content-Type: text/plain; charset="UTF-8"

Thank your support.

It did work after I used the default port 18080.
curl -k https://10.99.241.79:18080/redfish/v1

I had to indicate the account/password if I would like to access other node.
curl -k https://root:0penBmc@10.99.241.79:18080/redfish/v1/Managers/

Bmcweb will launch under one of two ports. If launched manually, it will
> launch under port 18080. If launched via systemd, it will use socket
> activation to launch under port 883 (to avoid conflicting with the existing
> phosphor-rest server). Another thing to recognize is that there is a debug
> html interface built into the redfish interface, so the easiest way to test
> is to use a web browser, and you will get the graphical interface with
> clickable links. Try pointing a web browser at
> https://10.99.241.79:18080/redfish/v1 and see if that works. PS, the
> trailing backslash is unimportant. Bmcweb is designed to strip the trailing
> backslash for you in either case, so redfish/v1 is the same as redfish/v1/
> -Ed



2018-07-10 16:39 GMT+08:00 Ratan Gupta <ratagupt@linux.vnet.ibm.com>:

> Hi Henbin,
>
> Can you try "curl -b cjar -k https://<ip>:18080/redfish/v1"?
>
> Seems default port is 18080
>
> https://github.com/openbmc/bmcweb/blob/master/src/webserver_main.cpp#L24
>
> Regards
>
> Ratan Gupta
>
>
>
> On Tuesday 10 July 2018 10:06 AM, Henbin Chang wrote:
>
> H Ed,
> I built bmcweb into my machine, and check the 'bmcweb' daemon was started
> up.
>
> ps aux | grep bmcweb
>   919 root       0:00 /usr/bin/bmcweb
>  8662 root       0:00 grep bmcweb
>
> But I couldn't access Redfish API through the below command.
> curl -b cjar -k https://10.99.241.79/redvish/v1/
>
> Could you help provide the suggestion?
>
> Thanks.
> -Henbin.
>
> There are several servers that support Redfish, and we have a working
>> group that meets weekly to talk through technical issues each week, which
>> you're welcome to attend. The only one checked into the upstream project is
>> bmcweb. If you need help getting it started, I'm happy to help.
>> https://github.com/openbmc/bmcweb
>
>
>
>

--00000000000080fae90570c2204d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank your support.<div><br></div><div>It did work after I=
 used the default port 18080.</div><div>curl -k <a href=3D"https://10.99.24=
1.79:18080/redfish/v1">https://10.99.241.79:18080/redfish/v1</a><br></div><=
div><br></div><div>I had to indicate the account/password if I would like t=
o access other node.</div><div>

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">curl -k <a href=3D"https://root:0penBmc@10.99.241.79:18080/redfish/v1/Man=
agers/">https://root:0penBmc@10.99.241.79:18080/redfish/v1/Managers/</a></s=
pan><br></div><div><br></div><div>

<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">Bmcweb will launch under =
one of two ports.  If launched manually, it will launch under port 18080.  =
If launched via systemd, it will use socket activation to launch under port=
 883 (to avoid conflicting with the existing phosphor-rest server).
Another thing to recognize is that there is a debug html interface built in=
to the redfish interface, so the easiest way to test is to use a web browse=
r, and you will get the graphical interface with clickable links.  Try poin=
ting a web browser at <a href=3D"https://10.99.241.79:18080/redfish/v1">htt=
ps://10.99.241.79:18080/redfish/v1</a> and see if that works.
PS, the trailing backslash is unimportant.  Bmcweb is designed to strip the=
 trailing backslash for you in either case, so redfish/v1 is the same as re=
dfish/v1/
-Ed</blockquote>

<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2=
018-07-10 16:39 GMT+08:00 Ratan Gupta <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ratagupt@linux.vnet.ibm.com" target=3D"_blank">ratagupt@linux.vnet.ibm.c=
om</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi Henbin,</p>
    <p>Can you try <span style=3D"color:rgb(69,69,69);font-family:&quot;Ope=
n Sans&quot;,Arial,Helvetica,sans-serif;font-size:14px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:normal;let=
ter-spacing:normal;text-align:left;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;display:inline!important=
;float:none">&quot;curl -b cjar -k
        <a class=3D"m_208777804762112596moz-txt-link-freetext">https://</a>=
&lt;ip&gt;:18080/redfish/v1&quot;<wbr>?</span></p>
    <p><span>Seems default port is 18080</span></p>
    <p><span><a class=3D"m_208777804762112596moz-txt-link-freetext" href=3D=
"https://github.com/openbmc/bmcweb/blob/master/src/webserver_main.cpp#L24" =
target=3D"_blank">https://github.com/openbmc/<wbr>bmcweb/blob/master/src/<w=
br>webserver_main.cpp#L24</a><br>
      </span></p>
    <p><span>Regards</span></p><span class=3D"HOEnZb"><font color=3D"#88888=
8">
    <p><span>Ratan Gupta<br>
      </span></p></font></span><div><div class=3D"h5">
    <p><br>
    </p>
    <br>
    <div class=3D"m_208777804762112596moz-cite-prefix">On Tuesday 10 July 2=
018 10:06 AM,
      Henbin Chang wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">H Ed,
        <div>I built bmcweb into my machine, and check the &#39;bmcweb&#39;
          daemon was started up.</div>
        <div><br>
        </div>
        <div>
          <div>ps aux | grep bmcweb</div>
          <div>=C2=A0 919 root=C2=A0 =C2=A0 =C2=A0 =C2=A00:00 /usr/bin/bmcw=
eb</div>
          <div>=C2=A08662 root=C2=A0 =C2=A0 =C2=A0 =C2=A00:00 grep bmcweb</=
div>
        </div>
        <div><br>
        </div>
        <div>But I couldn&#39;t access Redfish API through the below
          command.</div>
        <div>curl -b cjar -k <a href=3D"https://10.99.241.79/redvish/v1/" t=
arget=3D"_blank">https://10.99.241.79/redvish/<wbr>v1/</a><br>
        </div>
        <div><br>
        </div>
        <div>Could you help provide the suggestion?</div>
        <div><br>
        </div>
        <div>Thanks.</div>
        <div>-Henbin.</div>
        <div>
          <div><br>
          </div>
          <div>
            <blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">There are sev=
eral servers that support
              Redfish, and we have a working group that meets weekly to
              talk through technical issues each week, which you&#39;re
              welcome to attend. The only one checked into the upstream
              project is bmcweb. If you need help getting it started,
              I&#39;m happy to help.<br>
              <a href=3D"https://github.com/openbmc/bmcweb" target=3D"_blan=
k">https://github.com/openbmc/<wbr>bmcweb</a></blockquote>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--00000000000080fae90570c2204d--
