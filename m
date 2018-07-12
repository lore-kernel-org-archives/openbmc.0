Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::235; helo=mail-qt0-x235.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I/7+XiN2"; 
 dkim-atps=neutral
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R4rw3VmXzF35w
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 15:54:40 +1000 (AEST)
Received: by mail-qt0-x235.google.com with SMTP id c15-v6so2843618qtp.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=+glCWmTqYUPts5gMMwIOBXQaxlefqL/aN29GzJufKR8=;
 b=I/7+XiN2RCnyv8fcfTHIC+sHLtT4RLbiq0WDPmgogFnw+7Ch0rDYG7WfbJBUBJSECP
 JoDZCuf6tGdSlZ1R+hptuZgG/IwBARSI9yDtuUwM8IK+womLmJixGinY9CbGfTf1KiF2
 gCw1xjLM6vYQ9Lw1+HAsX+26g6oiqdSC3luYXdOAsIl7XjHCBP94BkkQNRK5cfYE/6d9
 bAf9TYqmUcPZ3yelnPSTLXF0SuwrhWarwSVh8xvKeTTqV0I/LVq/bHu9wRmzFAznKnSn
 owNrgZxQwJfO5+ISvuaK4akahBC0x11Zf2Kur+T5DizQAUpwIw1EkHRShTbaxIudhHCn
 eNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=+glCWmTqYUPts5gMMwIOBXQaxlefqL/aN29GzJufKR8=;
 b=nsRqNNX1fltgQPXnd7Hw3LAuSPXfPhM6nuy/1YkcC3wgciD4obJCqGQebv3DXnBNUb
 DGRy/loACKfH1mD220Pr2sLBROGBC/OznGY7XWhBvZPzKZBhko+alhNHcEGSJLQihkW0
 gE2rpvSxkZ4DB9bAmnAjUzsy1nGBAwVhigwNOGHhQQReX2y69vZKtVJp8VCcMEEA/cQg
 Y9TkPFdCMR0Nm2X92+wSdAjVtNQ79psZSGTRZoPagskHoBa6bIl9OlHdE1omIyR/D9m2
 N8ggQkHbnO00EtVyUDT9pePhnSsecc0TADon+AT8fTH5pZGa7JqykOLFMzkYlED65dP2
 uFHQ==
X-Gm-Message-State: AOUpUlEBkDeQvuJWAhtusfcjg7aruFSpHKzCr3UYgT3NnHcqWwSYgtm7
 nw4Sx4OIFP6hcdevXrgoWDUZAYfRJEWLWwjMu9treQ==
X-Google-Smtp-Source: AAOMgpdnZIr3lIr4is3V/qMwcxuxdW7s0kNmJTWgXrmkHndlxR9+HAfPDGIYelPGJiH6I5mCDWyPFM6DMLWYac+BF/w=
X-Received: by 2002:ac8:29f6:: with SMTP id 51-v6mr686938qtt.200.1531374877159; 
 Wed, 11 Jul 2018 22:54:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 22:54:36
 -0700 (PDT)
In-Reply-To: <CAG9c7cARHXbG2tByEjOONxmhy+wqsTLs-PuYk08qn-aFRN1fdw@mail.gmail.com>
References: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
 <ab6d15cb-f965-3211-fbaa-6a734bf6eb70@linux.vnet.ibm.com>
 <CAG9c7cARHXbG2tByEjOONxmhy+wqsTLs-PuYk08qn-aFRN1fdw@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Thu, 12 Jul 2018 13:54:36 +0800
Message-ID: <CAG9c7cBVWo=SAS7-_gLbhGwcRxy3Gi=nFQWTMqW0B_YpH1QR9A@mail.gmail.com>
Subject: Re: IPMI and Redfish support in openbmc Linux
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@intel.com
Content-Type: multipart/alternative; boundary="0000000000009233d60570c6ff04"
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
X-List-Received-Date: Thu, 12 Jul 2018 05:54:41 -0000

--0000000000009233d60570c6ff04
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

I upgraded my openbmc REPO with the Github and used the latest bmcweb
(commit id: 7885954af734ae61a2e1358740f84ad39248f18d.)

But I got the below error for compiling.
...
6: error: 'async_result_init' is not a member of 'boost::asio::detail'
     boost::asio::detail::async_result_init<
                          ^~~~~~~~~~~~~~~~~
/common/code_ref/s2600wf_openbmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:84:26:
note: suggested alternative: 'async_result_helper'
     boost::asio::detail::async_result_init<
                          ^~~~~~~~~~~~~~~~~
                          async_result_helper
/common/code_ref/s2600wf_openbmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:85:23:
error: expected primary-expression before ',' token
         MessageHandler, void(boost::system::error_code, message)>
                       ^
/common/code_ref/s2600wf_openbmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:85:25:
error: expected primary-expression before 'void'
         MessageHandler, void(boost::system::error_code, message)>
...

Suppose this is because the boost-dbus is too old.

Do you any suggestion?

Thanks.


2018-07-12 8:05 GMT+08:00 Henbin Chang <henbinchang@gmail.com>:

> Thank your support.
>
> It did work after I used the default port 18080.
> curl -k https://10.99.241.79:18080/redfish/v1
>
> I had to indicate the account/password if I would like to access other
> node.
> curl -k https://root:0penBmc@10.99.241.79:18080/redfish/v1/Managers/
>
> Bmcweb will launch under one of two ports. If launched manually, it will
>> launch under port 18080. If launched via systemd, it will use socket
>> activation to launch under port 883 (to avoid conflicting with the existing
>> phosphor-rest server). Another thing to recognize is that there is a debug
>> html interface built into the redfish interface, so the easiest way to test
>> is to use a web browser, and you will get the graphical interface with
>> clickable links. Try pointing a web browser at
>> https://10.99.241.79:18080/redfish/v1 and see if that works. PS, the
>> trailing backslash is unimportant. Bmcweb is designed to strip the trailing
>> backslash for you in either case, so redfish/v1 is the same as redfish/v1/
>> -Ed
>
>
>
> 2018-07-10 16:39 GMT+08:00 Ratan Gupta <ratagupt@linux.vnet.ibm.com>:
>
>> Hi Henbin,
>>
>> Can you try "curl -b cjar -k https://<ip>:18080/redfish/v1"?
>>
>> Seems default port is 18080
>>
>> https://github.com/openbmc/bmcweb/blob/master/src/webserver_main.cpp#L24
>>
>> Regards
>>
>> Ratan Gupta
>>
>>
>>
>> On Tuesday 10 July 2018 10:06 AM, Henbin Chang wrote:
>>
>> H Ed,
>> I built bmcweb into my machine, and check the 'bmcweb' daemon was started
>> up.
>>
>> ps aux | grep bmcweb
>>   919 root       0:00 /usr/bin/bmcweb
>>  8662 root       0:00 grep bmcweb
>>
>> But I couldn't access Redfish API through the below command.
>> curl -b cjar -k https://10.99.241.79/redvish/v1/
>>
>> Could you help provide the suggestion?
>>
>> Thanks.
>> -Henbin.
>>
>> There are several servers that support Redfish, and we have a working
>>> group that meets weekly to talk through technical issues each week, which
>>> you're welcome to attend. The only one checked into the upstream project is
>>> bmcweb. If you need help getting it started, I'm happy to help.
>>> https://github.com/openbmc/bmcweb
>>
>>
>>
>>
>

--0000000000009233d60570c6ff04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>I upgraded my openbmc REPO with =
the Github and used the latest bmcweb (commit id:=20

<span style=3D"color:rgb(68,77,86);font-family:SFMono-Regular,Consolas,&quo=
t;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;white-space:=
nowrap;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">7885954af734ae61a2e135=
8740f84ad39248f18d.</span>)</div><div><br></div><div>But I got the below er=
ror for compiling.<br></div><div>...</div><div><div>6: error: &#39;async_re=
sult_init&#39; is not a member of &#39;boost::asio::detail&#39;</div><div>=
=C2=A0 =C2=A0 =C2=A0boost::asio::detail::async_result_init&lt;</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~</div><div>/common/code_ref/s2600wf_open=
bmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+gitAU=
TOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:84:26: note: su=
ggested alternative: &#39;async_result_helper&#39;</div><div>=C2=A0 =C2=A0 =
=C2=A0boost::asio::detail::async_result_init&lt;</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 async_result_helper</div><=
div>/common/code_ref/s2600wf_openbmc/openbmc/build/tmp/work/armv6-openbmc-l=
inux-gnueabi/boost-dbus/1.0+gitAUTOINC+2ec8037525-r0/git/include/dbus/conne=
ction_service.hpp:85:23: error: expected primary-expression before &#39;,&#=
39; token</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MessageHandler, void(=
boost::system::error_code, message)&gt;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>/com=
mon/code_ref/s2600wf_openbmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnu=
eabi/boost-dbus/1.0+gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_se=
rvice.hpp:85:25: error: expected primary-expression before &#39;void&#39;</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MessageHandler, void(boost::syst=
em::error_code, message)&gt;</div></div><div>...</div><div><br></div><div>S=
uppose this is because the boost-dbus is too old.</div><div><br></div><div>=
Do you any suggestion?</div><div><br></div><div>Thanks.</div><div><br></div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-07-12=
 8:05 GMT+08:00 Henbin Chang <span dir=3D"ltr">&lt;<a href=3D"mailto:henbin=
chang@gmail.com" target=3D"_blank">henbinchang@gmail.com</a>&gt;</span>:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Thank your support.<div><b=
r></div><div>It did work after I used the default port 18080.</div><div>cur=
l -k <a href=3D"https://10.99.241.79:18080/redfish/v1" target=3D"_blank">ht=
tps://10.99.241.79:18080/<wbr>redfish/v1</a><br></div><div><br></div><div>I=
 had to indicate the account/password if I would like to access other node.=
</div><div>

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">curl -k <a href=3D"https://root:0penBmc@10.99.241.79:18080/redfish/v1/Man=
agers/" target=3D"_blank">https://root:0penBmc@10.99.<wbr>241.79:18080/redf=
ish/v1/<wbr>Managers/</a></span><br></div><div><br></div><div>

<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">Bmcweb will launch under =
one of two ports.  If launched manually, it will launch under port 18080.  =
If launched via systemd, it will use socket activation to launch under port=
 883 (to avoid conflicting with the existing phosphor-rest server).
Another thing to recognize is that there is a debug html interface built in=
to the redfish interface, so the easiest way to test is to use a web browse=
r, and you will get the graphical interface with clickable links.  Try poin=
ting a web browser at <a href=3D"https://10.99.241.79:18080/redfish/v1" tar=
get=3D"_blank">https://10.99.241.79:18080/<wbr>redfish/v1</a> and see if th=
at works.
PS, the trailing backslash is unimportant.  Bmcweb is designed to strip the=
 trailing backslash for you in either case, so redfish/v1 is the same as re=
dfish/v1/
-Ed</blockquote>

<br></div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">2018-07-10 16:39 GMT+08:00 Ratan Gup=
ta <span dir=3D"ltr">&lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.com" tar=
get=3D"_blank">ratagupt@linux.vnet.ibm.com</a>&gt;</span>:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
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
        <a class=3D"m_-6892043513174138775m_208777804762112596moz-txt-link-=
freetext">https://</a>&lt;ip&gt;:18080/redfish/v1&quot;<wbr>?</span></p>
    <p><span>Seems default port is 18080</span></p>
    <p><span><a class=3D"m_-6892043513174138775m_208777804762112596moz-txt-=
link-freetext" href=3D"https://github.com/openbmc/bmcweb/blob/master/src/we=
bserver_main.cpp#L24" target=3D"_blank">https://github.com/openbmc/bmc<wbr>=
web/blob/master/src/webserver_<wbr>main.cpp#L24</a><br>
      </span></p>
    <p><span>Regards</span></p><span class=3D"m_-6892043513174138775HOEnZb"=
><font color=3D"#888888">
    <p><span>Ratan Gupta<br>
      </span></p></font></span><div><div class=3D"m_-6892043513174138775h5"=
>
    <p><br>
    </p>
    <br>
    <div class=3D"m_-6892043513174138775m_208777804762112596moz-cite-prefix=
">On Tuesday 10 July 2018 10:06 AM,
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
arget=3D"_blank">https://10.99.241.79/redvish/v<wbr>1/</a><br>
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
k">https://github.com/openbmc/bmc<wbr>web</a></blockquote>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--0000000000009233d60570c6ff04--
