Return-Path: <nkskjames@gmail.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 025BF1A02BF
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=d7b0sd3d; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id u190so1957933pfb.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2016 21:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GksuTMKz733f3lm3kiIR3ONfSw6wVw6O1Emr2BPCUW8=;
 b=d7b0sd3dxFbZjv7IO+1nMt1dMR+WmIQGYgZGfLY6F9LfyrM7affVeLaqz1jiwoOUbs
 EkbQ1IHVgzIUvqfKr7CLuf/lhAWNYncfXTCituhVQlNVGSOnJjSW/ZxRm0VG92EtzpGM
 vvH5N1id3ulM8Tex/MOIzKacpwuNnX9iqOMdnvi7OjCrokTT5jfx9iSi/c71ouQtFYck
 OP+Xthrv4fjzJRmGl7/FqVQAsYIxEWAXYndYvyXILbpT7yF0MMm1JcxyYSHRLqWmBgmD
 jeVAVtxN6xWVgR8LM7NunThJnnKu59vSbddhTu2ouhU2XMmxAP4NtQK/AFO3neSMSAXl
 Kmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GksuTMKz733f3lm3kiIR3ONfSw6wVw6O1Emr2BPCUW8=;
 b=e3cNKQkVOgNWa5LvaWWc9RIpWzVp+3lg7QvEe1BbGYYliBZ75cKfd3MgGazSWuKF7Q
 +KmsLowkD8Zmjaj72gGKLmv/fC6vxXePntOenn3Aeh6H4pXhlcS6jQFe8hDXdILTXfvW
 0N9yJ1OxlOSMqhLS8r0nFx86HAL9okwhV1ZyBJRsIwvK2JZxMU7c7L6niMngfUZGfRZO
 BH7BObymPKLXHG9/zPQz083arcJF2brvkQDsNAN2kbkL0W3wRfjdX1FkDIvN0SIGAOHp
 ZhXuKt/lwnYGrLZIK85fGR2/mw+l/4Z3znkNxqwV6o6W3e3nxQ9+FNFifzUIzgl3rTsx
 yeqA==
X-Gm-Message-State: AD7BkJIeRQZdHx/U1IthCRuJHh7GI9Xv7BfwPr3DefxhABPaoFGK7Gd2dD4AhboMrcJzDA==
X-Received: by 10.98.32.23 with SMTP id g23mr23600864pfg.74.1457502629031;
 Tue, 08 Mar 2016 21:50:29 -0800 (PST)
Received: from [10.164.139.255] (mobile-166-171-248-205.mycingular.net.
 [166.171.248.205])
 by smtp.gmail.com with ESMTPSA id w20sm8946402pfi.31.2016.03.08.21.50.28
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 08 Mar 2016 21:50:28 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH phosphor-host-ipmid v2] DCMI GET_POWER_LEVEL bad return
 code
From: Norman James <nkskjames@gmail.com>
X-Mailer: iPhone Mail (13D15)
In-Reply-To: <87io0w9q9h.fsf@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <87D76E1F-9B48-4477-9230-C3A63957268B@gmail.com>
References: <1457453438-9977-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87io0w9q9h.fsf@linux.vnet.ibm.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
X-Mailman-Approved-At: Fri, 01 Apr 2016 09:11:02 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Date: Wed, 09 Mar 2016 05:50:31 -0000
X-Original-Date: Tue, 8 Mar 2016 21:50:27 -0800
X-List-Received-Date: Wed, 09 Mar 2016 05:50:31 -0000

I canceled this pull request.

Sent from my iPhone

> On Mar 8, 2016, at 9:25 PM, Stewart Smith <stewart@linux.vnet.ibm.com> wro=
te:
>=20
> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>=20
>> From: Norman James <njames@us.ibm.com>
>>=20
>> This function uses static data and should always
>> return a good return code.  This was causing OCC
>> not to start.
>>=20
>> Signed-off-by: Norman James <nkskjames@gmail.com>
>> ---
>> dcmihandler.C | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/dcmihandler.C b/dcmihandler.C
>> index fafebdc..5e7d879 100644
>> --- a/dcmihandler.C
>> +++ b/dcmihandler.C
>> @@ -11,7 +11,7 @@ ipmi_ret_t ipmi_dcmi_get_power_limit(ipmi_netfn_t netfn=
, ipmi_cmd_t cmd,
>>                               ipmi_request_t request, ipmi_response_t res=
ponse,=20
>>                               ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
>> {
>> -    ipmi_ret_t rc =3D IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT;
>> +    ipmi_ret_t rc =3D 0;
>>=20
>>     // dcmi-v1-5-rev-spec.pdf 6.6.2.
>=20
> Shouldn't the value of rc be something that is an ipmi_ret_t ?
>=20
>>     // This is good enough for OpenBMC support for OpenPOWER based system=
s
>> @@ -37,4 +37,3 @@ void register_netfn_dcmi_functions()
>>     ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, i=
pmi_dcmi_get_power_limit);
>>     return;
>> }
>> -// 956379
>> \ No newline at end of file
>=20
> Above hunk is irrelevant.
>=20
> --=20
> Stewart Smith
> OPAL Architect, IBM.
>=20
