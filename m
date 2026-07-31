Return-Path: <openbmc+bounces-2343-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08629C55167
	for <openbmc@archiver.kernel.org>; Fri, 31 Jul 2026 09:00:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hBKm628zlz2yYq;
	Fri, 31 Jul 2026 19:00:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785488438;
	cv=none; b=RbL/z/2dI3k1V/DNO6IKqi3n9VhOsNw1WNU0VyexAVrTS6xNk6kyaE1oFXMpW+6uMtLXuXaU232bRpay/eLlqrmsWoOcHP8L8QxnOrO2JNAYCrBlT0liuvqIsLC/LWjHhS+rsr5esoY3UAnWYIBLnL+2+xUDjjMvmqKtvGqE3zBhrK3yyIjcmn2A4CWZwrCMuOsmKSiILkOCm4ucKCwMTzwt6JEayMMjLGyH3Yte8HpZPLXa+p6BOgQDpfbQHkEAxKwSYI6jK5btPp1nLXqboAyYbrxECGm877G1NhI9kzqy4ocMmFCQXen0klmYINBk/16doOUHBVyCytl/Wo8cTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785488438; c=relaxed/relaxed;
	bh=wr/y2mt0sxIYfGy3Cj+7XIQTJaynAGYABtWLcqJSPQ8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=KeFrgnMjFSMHDrJQU+XXRWSOVMu9WdlJlSZzTCnT/ZfVHxhayQGSSXCPX3O9wV1RyB7yigAwIVUTrEQPDCpWmzW2sqnjM6fIW50sVFRTMVWRkL+tqmOlmDdoBnhqeM1ukzqTqU5xTiGou5OwWwNYMyYGcOl5UZNUpmUqsuBKeAeRijAarkqLMasEPm9egrm49NZoLIUa38xlprFGVOSXSETIvKRw49Kh1St67WEOoD32ZApaQTIiINiiYzFRKRGlhngGcsX2ufhgddWDOnODnXDh6ePLXHpvsSg8m4rhiZywaKwndrLmC+iN7rMlRRX/GQlYcrqkGi+nS8y17K4c+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Z2TUUs8e; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=alexander.hansen@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Z2TUUs8e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=alexander.hansen@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hBKm32lLvz2xg8
	for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2026 19:00:33 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so902401a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2026 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785488429; x=1786093229; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr/y2mt0sxIYfGy3Cj+7XIQTJaynAGYABtWLcqJSPQ8=;
        b=Z2TUUs8eUU/07ZZHiKYdZZNcZn5JQZFj0NnvYPBeYEcnAyFFNiFYS+GmcdcLoZdJ7V
         9xiINQr900vP+g3hlg2eX8mIFSvwwFPjvcMJkKA77EZSMW+X70cUuxbc0ZbchVDRPBFx
         BiNI+jHH59J4GJ57kKKc3UeU7hy2DMZS/9WsxAQZhgHaYXUmNg7355ZgL1TfRUAaGxxa
         wUp/+Vi+gg/6Lv/3hxMwM7b7XgUUR6YfnAMJJyNAJOfawHHwiTiy9RYixrr3H0DCwbcL
         WI1jDOLsc2nnOqw7enzcbaH2qhM6Vo/hCCBGekmnbN7X25AbIuk2xgvfQZKS8L+V4Cn0
         xVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488429; x=1786093229;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr/y2mt0sxIYfGy3Cj+7XIQTJaynAGYABtWLcqJSPQ8=;
        b=A54hNR0Y6ERK5pCjH73Zmnzo6X1LBeGToKPKPCfrtidD4ZrozQXsBmwltGc/EPwfQB
         liQ6XVeLVOPqIAd6opzVlJEpNooJMP+AY8fCL1NwjvB9btyEELKrshZcjViqqJBMhOcy
         N1GlpKYlPQujEa3Z25ikMgEvkNSA+7Q6tL+MqMh6NxEPfpQkzwl2RwTYjidj6V+oqfNi
         Mk8p/A8ua/DlKj9YXpt1muPYZmjnjHcD6IiOYO9Yd1wt5D+5xj/cbSXyH+Pdlfx2URTn
         KPt4V5sBYG9zi0NCulKTOhQxBKs3PFgd40M2zEubUYkfmSVXY/6MHkFbdZ/rvFMzd0kC
         w0qw==
X-Gm-Message-State: AOJu0YxEYj0qbT31VozDPVZotqprh1iT34WmhGq5nAjWYhp8GIQars7b
	Em89iTU6UmTRhKQ5/fZgjwCiN9z8r/wGOkDVb8wiYpdRg0YJWqiG72mJBx1HNueo/3HaWMLQIy+
	BtON+hHs=
X-Gm-Gg: AR+sD13AuDEVJ3fzILXHWziXb8baDjjQz/Rgv1pIAX0WsXV284RHEMHaiJ91LTm0mWD
	kphyN6GdSOi/GhaKn2G6N4EVPCOXo6l3AbRvtF4cGdLSSBJ9MmxHtPgKJiAtienLFBE0Lh45zEF
	4mCqCQZriIycd6bEhxsZ03SF9/P99PKCB38fOfrP9fJN9m/DLl1KVp68OHtUyPjZZplGPkHwa+5
	3NKMmZVdZOxFSQvIOjmVZEtRaxu+GD414JmB4T8KZJBX15zWFl+/H/5RoO74RsmElg9wWdtTQCA
	aFcGtwMTdrEX2x8uEfzNic6H2CHiLAxP5rkNz7kXzDtfn8tBaC2V6LHrL6aGWleNIeBWzfLDqil
	DIEajApLeWRN/EvtZOjPv5rsEuSaCyTKI62nMKhhG7tRYGucJbBl1B7e8XBwyF7Q9b8Dc41t1Hj
	n2IE1elTB9ba8o5DcJUoeGhlGVaxhtdwGElzp69emslGsp5Vi1BRxlaJzCOVV57OoOcZPEwDvvu
	xG+vqpAUJt5p5ex
X-Received: by 2002:a17:907:84a:b0:c16:1901:6b8a with SMTP id a640c23a62f3a-c1fd23986e2mr60285066b.53.1785488427758;
        Fri, 31 Jul 2026 02:00:27 -0700 (PDT)
Received: from [10.93.15.195] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4532e1esm69360566b.50.2026.07.31.02.00.26
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 02:00:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------J0x1Mn9wHnBEMbFTI0z3N0ol"
Message-ID: <408d1ed9-4f8a-4eef-a751-2bfc3f79fdc3@9elements.com>
Date: Fri, 31 Jul 2026 11:00:25 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Gentle Follow-up] [stdexec] Long-Term Ownership and Maintenance
 of stdexec Dependency
To: openbmc@lists.ozlabs.org
References: <PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>
 <F382C4AF-9F06-4EE7-802F-5F229AABA207@nexthop.ai>
Content-Language: en-US
From: Alexander Hansen <alexander.hansen@9elements.com>
In-Reply-To: <F382C4AF-9F06-4EE7-802F-5F229AABA207@nexthop.ai>

This is a multi-part message in MIME format.
--------------J0x1Mn9wHnBEMbFTI0z3N0ol
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chinmoy,

why would we fork our dependency here ?

 > Reduced risk from repository access, policy, or ownership changes 
outside the OpenBMC project

What is meant by this? We are consuming the code from stdexec. How they 
do their governance or policy is maybe irrelevant to us as long as the 
license is compatible and the code is working ?

What is "risk of repository access" ? If the SRCREV is bumped in the 
yocto recipe, you can review any changes done to the project, right?

The recipe is here: meta-phosphor/recipes-extended/stdexec/stdexec_git.bb

If you build subprojects out of tree then meson will usually not fetch a 
new subproject revision unless you explicitly tell it to. So in each 
case you can review all code changes..

 > Broader review and maintainer participation and long-term support

If someone wants to review the changes to stdexec they can do so at 
https://github.com/NVIDIA/stdexec/pulls ?

What is preventing you from reviewing and long-term supporting stdexec 
via the normal github workflow?

 > Improved community ownership , transparency and reduce dependency risk

IMO ownership means understanding and maintaining the code. Who in the 
openbmc community is even working on stdexec?
When i look at the contributors, the only one i see from openbmc 
community is Patrick 
https://github.com/NVIDIA/stdexec/graphs/contributors?all=1

(maybe i am wrong and there are more people working on it ?)

Who should own and maintain this stdexec fork you are proposing?
And is the person you are proposing to maintain this qualified to do so?
What would be an example change to stdexec you see as required that 
cannot be done in the upstream repo and therefore would require 
forking/patching ?

Thanks,
Alexander

On 7/30/26 07:36, Chinmoy Dey wrote:
>
> Hi Team,
>
> Just following up on my earlier email and resending it to make sure it 
> hasn’t been missed.
>
> I would appreciate it if you could please take a look when you get a 
> chance.
>
> Regards,
> Chinmoy
>
>
>> On 23 Jun 2026, at 5:59 PM, Chinmoy Dey <chinmoy@nexthop.ai> wrote:
>>
>> Hi OpenBMC Community,
>>
>> I would like to start a discussion around the long-term ownership and 
>> maintenance model for the *|stdexec|* dependency that is currently 
>> part of the *OpenBMC* dependency chain. As I understand it today:
>>
>>  *
>>     |bmcweb| references |sdbusplus| through|subprojects/sdbusplus.wrap|:
>>      o
>>         https://github.com/openbmc/bmcweb
>>  *
>>     |sdbusplus| is maintained under the OpenBMC organization:
>>      o
>>         https://github.com/openbmc/sdbusplus
>>      o
>>         https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap
>>  *
>>     |sdbusplus| in turn references |stdexec| through
>>     |subprojects/stdexec.wrap|||:
>>      o
>>         https://github.com/NVIDIA/stdexec
>>
>> First, I would like to acknowledge and appreciate the work that has 
>> gone into this implementation. The intent of this note is not to 
>> question the quality of the code or the contributions made by NVIDIA, 
>> but rather to discuss whether there may be an opportunity to align 
>> this dependency more closely with OpenBMC’s long-term governance and 
>> maintenance model. Since |stdexec| is now part of a commonly consumed 
>> dependency path within OpenBMC, it may be worth considering whether a 
>> community-maintained approach could provide additional benefits, such as:
>>
>>  *
>>     Reduced risk from repository access, policy, or ownership changes
>>     outside the OpenBMC project
>>  *
>>     Broader review and maintainer participation and long-term support
>>  *
>>     Improved community ownership , transparency and reduce dependency
>>     risk
>>
>> If there have already been discussions on this topic, or if there is 
>> a preferred roadmap for the dependency, I would greatly appreciate 
>> any references or guidance. My goal is simply to explore whether we 
>> can further strengthen the sustainability, transparency, and 
>> long-term maintainability of the OpenBMC dependency ecosystem as it 
>> continues to grow.
>>
>> Thank you for your time and consideration. I look forward to hearing 
>> the community’s thoughts.
>>
>> Best regards,
>>
>> Chinmoy Dey
>>
>>
>
--------------J0x1Mn9wHnBEMbFTI0z3N0ol
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Chinmoy,<br>
      <br>
      why would we fork our dependency here ?<br>
      <br>
      &gt; Reduced risk from repository access, policy, or ownership
      changes outside the OpenBMC project<br>
      <br>
      What is meant by this? We are consuming the code from stdexec. How
      they do their governance or policy is maybe irrelevant to us as
      long as the license is compatible and the code is working ?<br>
      <br>
      What is "risk of repository access" ? If the SRCREV is bumped in
      the yocto recipe, you can review any changes done to the project,
      right?<br>
      <br>
      The recipe is here:
      meta-phosphor/recipes-extended/stdexec/stdexec_git.bb<br>
      <br>
      If you build subprojects out of tree then meson will usually not
      fetch a new subproject revision unless you explicitly tell it to.
      So in each case you can review all code changes..<br>
      <br>
      &gt; Broader review and maintainer participation and long-term
      support<br>
      <br>
      If someone wants to review the changes to stdexec they can do so
      at <a class="moz-txt-link-freetext" href="https://github.com/NVIDIA/stdexec/pulls">https://github.com/NVIDIA/stdexec/pulls</a> ?<br>
      <br>
      What is preventing you from reviewing and long-term supporting
      stdexec via the normal github workflow?<br>
      <br>
      &gt; Improved community ownership , transparency and reduce
      dependency risk<br>
      <br>
      IMO ownership means understanding and maintaining the code. Who in
      the openbmc community is even working on stdexec?<br>
      When i look at the contributors, the only one i see from openbmc
      community is Patrick
      <a class="moz-txt-link-freetext" href="https://github.com/NVIDIA/stdexec/graphs/contributors?all=1">https://github.com/NVIDIA/stdexec/graphs/contributors?all=1</a>  <br>
      <br>
      (maybe i am wrong and there are more people working on it ?)<br>
      <br>
      Who should own and maintain this stdexec fork you are proposing?<br>
      And is the person you are proposing to maintain this qualified to
      do so?<br>
      What would be an example change to stdexec you see as required
      that cannot be done in the upstream repo and therefore would
      require forking/patching ?<br>
      <br>
      Thanks,<br>
      Alexander<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 7/30/26 07:36, Chinmoy Dey wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:F382C4AF-9F06-4EE7-802F-5F229AABA207@nexthop.ai">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br id="lineBreakAtBeginningOfMessage">
        <div>
          <p class="p1"><span style="font-size: 14px;">Hi Team,</span></p>
          <p class="p1"><span style="font-size: 14px;">Just following up
              on my earlier email and resending it to make sure it
              hasn’t been missed.</span></p>
          <p class="p1"><span style="font-size: 14px;">I would
              appreciate it if you could please take a look when you get
              a chance.</span></p>
          <p class="p1"><span style="font-size: 14px;">Regards,<br>
              Chinmoy</span></p>
          <p class="p1"><br>
          </p>
          <blockquote type="cite">
            <div>On 23 Jun 2026, at 5:59 PM, Chinmoy Dey
              <a class="moz-txt-link-rfc2396E" href="mailto:chinmoy@nexthop.ai">&lt;chinmoy@nexthop.ai&gt;</a> wrote:</div>
            <br class="Apple-interchange-newline">
            <div>
              <meta http-equiv="Content-Type"
                content="text/html; charset=UTF-8">
              <div>
                <p dir="ltr" class="p1"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">Hi
                    OpenBMC Community,</span></p>
                <p class="p1"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">I
                    would like to start a discussion around the
                    long-term ownership and maintenance model for the
                  </span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; color: rgb(81, 167, 249);"><b><code>stdexec</code></b></span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;"> dependency
                    that is currently part of the </span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; color: rgb(81, 167, 249);"><b>OpenBMC</b></span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;"> dependency
                    chain. As I understand it today:</span></p>
                <ul style="text-align: left;">
                  <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                    <div><span style="color: rgb(81, 167, 249);"><code>bmcweb</code></span> references
                      <span style="color: rgb(81, 167, 249);"><code>sdbusplus</code></span> through<span
                        style="color: rgb(81, 167, 249);">
                        <code>subprojects/sdbusplus.wrap</code></span>:</div>
                  </li>
                  <ul
data-editing-info="{&quot;applyListStyleFromLevel&quot;:true}"
                    style="text-align: left; list-style-type: circle;">
                    <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                      <div><a href="https://github.com/openbmc/bmcweb"
data-outlook-id="d8c2b49c-07aa-43d2-acc3-e2c8c7768819"
                          moz-do-not-send="true"
                          class="moz-txt-link-freetext">https://github.com/openbmc/bmcweb</a> </div>
                    </li>
                  </ul>
                  <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                    <div><span style="color: rgb(81, 167, 249);"><code>sdbusplus</code></span> is
                      maintained under the OpenBMC organization:</div>
                  </li>
                  <ul
data-editing-info="{&quot;applyListStyleFromLevel&quot;:true}"
                    style="text-align: left; list-style-type: circle;">
                    <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                      <div><a
                          href="https://github.com/openbmc/sdbusplus"
data-outlook-id="1fe0a3a9-3766-408b-8060-f3453e915191"
                          moz-do-not-send="true"
                          class="moz-txt-link-freetext">https://github.com/openbmc/sdbusplus</a> </div>
                    </li>
                    <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                      <div dir="ltr" style=""><a
href="https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap"
data-outlook-id="1447a88a-4fa7-4732-b205-d105cb87620c"
                          moz-do-not-send="true"
                          class="moz-txt-link-freetext">https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap</a></div>
                    </li>
                  </ul>
                  <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                    <div><span style="color: rgb(81, 167, 249);"><code>sdbusplus</code></span> in
                      turn references
                      <span style="color: rgb(81, 167, 249);"><code>stdexec</code></span> through
                      <span style="color: rgb(81, 167, 249);">
                        <code>subprojects/stdexec.wrap</code></span><code>
                      </code>:</div>
                  </li>
                  <ul
data-editing-info="{&quot;applyListStyleFromLevel&quot;:true}"
                    style="text-align: left; list-style-type: circle;">
                    <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                      <div><a href="https://github.com/NVIDIA/stdexec"
data-outlook-id="65d6a77f-f757-46fc-9226-94383fc74d4e"
                          moz-do-not-send="true"
                          class="moz-txt-link-freetext">https://github.com/NVIDIA/stdexec</a> </div>
                    </li>
                  </ul>
                </ul>
                <p class="p1"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">First,
                    I would like to acknowledge and appreciate the work
                    that has gone into this implementation. The intent
                    of this note is not to question the quality of the
                    code or the contributions made by NVIDIA, but rather
                    to discuss whether there may be an opportunity to
                    align this dependency more closely with OpenBMC’s
                    long-term governance and maintenance model. Since </span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; color: rgb(81, 167, 249);"><code>stdexec</code></span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;"> is
                    now part of a commonly consumed dependency path
                    within </span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; color: rgb(81, 167, 249);">OpenBMC</span><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">,
                    it may be worth considering whether a
                    community-maintained approach could provide
                    additional benefits, such as:</span></p>
                <ul style="text-align: left;">
                  <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                    <div>Reduced risk from repository access, policy, or
                      ownership changes outside the OpenBMC project</div>
                  </li>
                  <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                    <div dir="ltr" style="font-size: 18.666666px;"><span
                        style="background-color: rgb(255, 255, 255);">Broader
                        review and maintainer participation and
                        long-term support</span></div>
                  </li>
                  <li
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">
                    <div>Improved community ownership , transparency and
                      reduce <span
style="font-size: 18.666666px; background-color: rgb(255, 255, 255);">
                        dependency risk</span></div>
                  </li>
                </ul>
                <p class="p2"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">If
                    there have already been discussions on this topic,
                    or if there is a preferred roadmap for the
                    dependency, I would greatly appreciate any
                    references or guidance. My goal is simply to explore
                    whether we can further strengthen the
                    sustainability, transparency, and long-term
                    maintainability of the OpenBMC dependency ecosystem
                    as it continues to grow.</span></p>
                <p class="p1"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">Thank
                    you for your time and consideration. I look forward
                    to hearing the community’s thoughts.</span></p>
                <p class="p1"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt;">Best
                    regards,</span></p>
                <p class="p1"
                  style="text-align: left; text-indent: 0px;"><span
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt;">Chinmoy
                    Dey</span></p>
                <div dir="ltr"
style="font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt;">
                  <br>
                </div>
                <div id="ms-outlook-mobile-signature" dir="ltr"
                  style="color: inherit; background-color: inherit;">
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------J0x1Mn9wHnBEMbFTI0z3N0ol--

