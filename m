Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22b; helo=mail-qt0-x22b.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mMZbNIZ7"; 
 dkim-atps=neutral
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zsLJ1wR7zDrq8
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 11:56:24 +1000 (AEST)
Received: by mail-qt0-x22b.google.com with SMTP id j7-v6so27407qtp.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 18:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=clafFdgmV3r3Bi/u3yV2ZRGVgrKYsLt0I07DPTMTA5g=;
 b=mMZbNIZ716q3sip3OFm32Otlih0AAhlL2oWZ4vc3QtTIswTi1W/pXhJ5nlnefMZWhl
 iiMWqxTN/lDU6ZQ5RqULTeiReV7mQSSMZm/nwcEOCJ3I0BF9bmuTrylU4PnVekHa6M6d
 JIBxoaGhPUAd096BMmhIECWKO1KJdf4ZQ5WfqaHginwwhVMn0fw/SmJTDjy1zRNiOStx
 Pkb0HpWDthdBFG76AUNdJG1zrWVOChg5mY72GPOb68MdQ3R6PR7vsotkoArbOqOWDIQS
 9ud1qscxm72pPFd5yILAe5CgtExZV8ML6GEJo9iapL0ph8LDkc23LWSSO/pghJpo0Pmc
 doRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=clafFdgmV3r3Bi/u3yV2ZRGVgrKYsLt0I07DPTMTA5g=;
 b=jmtNLMbzKbHrco0cV9dCZqHMpnCf7CsUzmjRMiI1eOTIvnyGWFUhl/yPSS1y95AsgY
 nSMMj1VU/N7G6+sHHTnuvK3yBeFaA5xeJazHqX7Ke3ixUAlVEoAMsNt1hEVF4I5agO44
 fMAQLd2nYzvORPO8KwF4zLEQRnyM1BZGTdA7YV2nyN7lT6I18tkalc70UIFiopEOQIUV
 N1oTnl1yKLpBKXnY0KY178fxaJFtu+DGlABVMVlYHIwgZ2AxpBEZYnkwWKt49V+Sb1hv
 HEYE/Pl+wQjTtkzioqBvZm7nwO5AlouhtQy4okwmtS9Zx4ml9NAI9Lsa2GMv/sxwJwH0
 SCGg==
X-Gm-Message-State: APzg51AbnO5fd4wdy7prj/JSKEZeVQSOrkynKrH/kib342iDxC26GAE4
 rUPkzj6IiN1Zfz3l8NGC+TVuzxU9XPidDTJN2Hc=
X-Google-Smtp-Source: ANB0VdagcgPCwr0xKtKF05OZgII2VcD7o87SYqDREG5t5++VB91zcuNDc3KpPXAjdA6+R8CxjEzHj3sVO1/cSfJ778A=
X-Received: by 2002:ac8:3525:: with SMTP id
 y34-v6mr17615631qtb.151.1535421381098; 
 Mon, 27 Aug 2018 18:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cC25xbJZChsGEh1=yt5BnJjGufH2yEq5L-ws-2Y-H31gA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345832E11@ORSMSX114.amr.corp.intel.com>
 <CAG9c7cD0CO59CiU8czWORY8ZMCf8xeemvp-bEA21Qv4QaNZ+eA@mail.gmail.com>
In-Reply-To: <CAG9c7cD0CO59CiU8czWORY8ZMCf8xeemvp-bEA21Qv4QaNZ+eA@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 28 Aug 2018 09:56:09 +0800
Message-ID: <CAG9c7cAbc1REEQtUW3uxar27zzuoj2q_CHNJZDXohb1xPdoS9Q@mail.gmail.com>
Subject: Re: UpdateService in Redfish
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000041220574752658"
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
X-List-Received-Date: Tue, 28 Aug 2018 01:56:25 -0000

--0000000000000041220574752658
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ed,
Could you share the correct usage for UpdateService?
Or please tell me where I can find the answer.

Thanks for your support.

BRs,
Henbin.


Henbin Chang <henbinchang@gmail.com> =E6=96=BC 2018=E5=B9=B48=E6=9C=8822=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:30=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Hi Ed,
> Thanks for your response.
>
> I tried to send POST request but got "Method Not Allowed".
>
> curl -k -H "Content-Type: application/json" -X POST -d '{"data":
> ["10.99.240.105", "s2600wf-20180118092748.all.tar"]}'
> https://root:0penBmc@10.99.241.36:883/redfish/v1/UpdateService
>
> Please help correct if any typo.
>
> Thanks.
>
> BRs,
> Henbin.
>
> Tanous, Ed <ed.tanous@intel.com> =E6=96=BC 2018=E5=B9=B48=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:07=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
>> Yes, it should work, although it=E2=80=99s relatively new, so it=E2=80=
=99s possible there
>> are bugs or corner cases we haven=E2=80=99t hit yet.  If you find new is=
sues, it
>> would be great if you could file them against the bmcweb project.
>>
>>
>>
>> To use the endpoint, it should just be a matter of sending a POST reques=
t
>> to the update URL containing the tarred image with the manifest in the
>> body.  It works very similarly to the existing update endpoints, it just
>> meets the Redfish specifications.
>>
>>
>>
>> One thing to watch out for is payload size.  Bmcweb imposes appropriate
>> payload limits, but if you=E2=80=99re reverse proxying the server behind=
 nginx, you
>> might have nginx payload limits imposed and that=E2=80=99ll need to be u=
pdated.
>>
>>
>>
>> -Ed
>>
>>
>>
>> *From:* Henbin Chang [mailto:henbinchang@gmail.com]
>> *Sent:* Tuesday, August 21, 2018 1:02 AM
>> *To:* Tanous, Ed <ed.tanous@intel.com>; OpenBMC Maillist <
>> openbmc@lists.ozlabs.org>
>> *Subject:* UpdateService in Redfish
>>
>>
>>
>> Hi Ed,
>>
>> I search the below commit in the bmcweb REPO.
>>
>>
>>
>> commit acb7cfb4b571bd2045b1d269625ba054806a466d
>>
>> Author: Jennifer Lee <jennifer1.lee@intel.com>
>>
>> Date:   Thu Jun 7 16:08:15 2018 -0700
>>
>>
>>
>>     Implement POST for redfish UpdateService
>>
>>
>>
>>     - POST an image file to /redfish/v1/UpdateServer uri will upload the
>>
>>       image and activate it
>>
>>     - Modified SoftwareInventoryCollection to list items with
>>
>>       xyz.openbmc_project.Software.Activation/Activation property as
>>
>>     "xyz.openbmc_project.Software.Activation.Activations.Active"
>>
>>     - SoftwareInventory odata.id is identified with DBus generated uuid
>>
>>
>>
>> May I know if BMC FW can be updated through UpdateService in Redfish?
>>
>> If yes, could you share how to use it?
>>
>>
>>
>> Besides that, I add some debug message in
>> the redfish-core/lib/update_service.hpp but output nothing
>>
>>
>>
>> Could you give some suggestion?
>>
>> ...
>>
>> private:
>>
>>   void doGet(crow::Response &res, const crow::Request &req,
>>
>>              const std::vector<std::string> &params) override {
>>
>>     std::cout << "Henbin=3D" << __FILE__<< ": "<<__LINE__ << "\n";
>>
>>           BMCWEB_LOG_INFO << "Henbin=3D" << __FILE__<< ": "<<__LINE__ <<
>> "\n";
>>
>>     res.jsonValue =3D Node::json;
>>
>>     res.end();
>>
>>   }
>>
>> ...
>>
>>
>>
>> Thanks.
>>
>>
>>
>> BRs,
>>
>> Henbin.
>>
>

--0000000000000041220574752658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div>Could you share the correct usage for UpdateSer=
vice?</div><div>Or please tell me where I can find the answer.</div><div><b=
r></div><div>Thanks for your support.</div><div><br></div><div>BRs,</div><d=
iv>Henbin.</div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">Henbin Chang &lt;<a href=3D"mailto:henbinchang@gmail.com">henbinc=
hang@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B48=E6=9C=8822=E6=97=A5 =E9=80=
=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:30=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Ed,<div>Thanks for your re=
sponse.</div><div><br></div><div>I tried to send POST request but got=C2=A0=
&quot;Method Not Allowed&quot;.</div><div><br></div><div>curl -k -H &quot;C=
ontent-Type: application/json&quot; -X POST -d &#39;{&quot;data&quot;: [&qu=
ot;10.99.240.105&quot;, &quot;s2600wf-20180118092748.all.tar&quot;]}&#39; <=
a href=3D"https://root:0penBmc@10.99.241.36:883/redfish/v1/UpdateService" t=
arget=3D"_blank">https://root:0penBmc@10.99.241.36:883/redfish/v1/UpdateSer=
vice</a><br></div><div><br></div><div>Please help=C2=A0correct if any typo.=
</div><div><br></div><div>Thanks.</div><div><br></div><div>BRs,</div><div>H=
enbin.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Tanous, Ed &lt;=
<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.co=
m</a>&gt; =E6=96=BC 2018=E5=B9=B48=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =
=E4=B8=8B=E5=8D=8811:07=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-7926038133573238008m_1672218689135872985WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Yes, it should work, although it=E2=
=80=99s relatively new, so it=E2=80=99s possible there are bugs or corner c=
ases we haven=E2=80=99t hit yet.=C2=A0 If you find new issues, it would be =
great
 if you could file them against the bmcweb project.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">To use the endpoint, it should just b=
e a matter of sending a POST request to the update URL containing the tarre=
d image with the manifest in the body.=C2=A0 It works
 very similarly to the existing update endpoints, it just meets the Redfish=
 specifications.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">One thing to watch out for is payload=
 size.=C2=A0 Bmcweb imposes appropriate payload limits, but if you=E2=80=99=
re reverse proxying the server behind nginx, you might have
 nginx payload limits imposed and that=E2=80=99ll need to be updated.<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><a name=3D"m_-7926038133573238008_m_1672218689135872=
985__MailEndCompose"><span style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></a></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"m_-7926038133573238008_m_1672218689135872=
985______replyseparator"></a><b><span style=3D"font-size:11.0pt;font-family=
:&quot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:1=
1.0pt;font-family:&quot;Calibri&quot;,sans-serif"> Henbin Chang [mailto:<a =
href=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang@gmail.c=
om</a>]
<br>
<b>Sent:</b> Tuesday, August 21, 2018 1:02 AM<br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&g=
t;<br>
<b>Subject:</b> UpdateService in Redfish<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi Ed,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">I search the below commit in the=C2=A0bmcweb=C2=A0RE=
PO.<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">commit acb7cfb4b571bd2045b1d269625ba054806a466d<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Author: Jennifer Lee &lt;<a href=3D"mailto:jennifer1=
.lee@intel.com" target=3D"_blank">jennifer1.lee@intel.com</a>&gt;<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">Date:=C2=A0 =C2=A0Thu Jun 7 16:08:15 2018 -0700<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 Implement POST for redfish UpdateServi=
ce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 - POST an image file to /redfish/v1/Up=
dateServer uri will upload the<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 image and activate it<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 - Modified SoftwareInventoryCollection=
 to list items with<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 xyz.openbmc_project.Software.Ac=
tivation/Activation property as<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 &quot;xyz.openbmc_project.Software.Act=
ivation.Activations.Active&quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 - SoftwareInventory <a href=3D"http://=
odata.id" target=3D"_blank">odata.id</a> is identified with DBus generated =
uuid<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">May I know if BMC FW can be updated through=C2=A0Upd=
ateService in Redfish?=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If yes, could you share how to use it?<u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Besides that, I add some debug message in the=C2=A0r=
edfish-core/lib/update_service.hpp=C2=A0but output nothing=C2=A0<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Could you give some suggestion?=C2=A0=C2=A0<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal">...<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">private:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 void doGet(crow::Response &amp;res, const cro=
w::Request &amp;req,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t std::vector&lt;std::string&gt; &amp;params) override {<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 std::cout &lt;&lt; &quot;Henbin=3D&quo=
t; &lt;&lt; __FILE__&lt;&lt; &quot;: &quot;&lt;&lt;__LINE__ &lt;&lt; &quot;=
\n&quot;;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BMCWEB_LOG_INFO &lt;&lt; &quot;Henbin=3D&quot; &lt;&lt; __FILE__&lt;&lt=
; &quot;: &quot;&lt;&lt;__LINE__ &lt;&lt; &quot;\n&quot;;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 res.jsonValue =3D Node::json;<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 res.end();<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 }<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">...<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BRs,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Henbin.<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>
</blockquote></div>

--0000000000000041220574752658--
