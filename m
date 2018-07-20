Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22e; helo=mail-oi0-x22e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z978646f"; 
 dkim-atps=neutral
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41XFsx3kjQzDqCG
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jul 2018 01:58:28 +1000 (AEST)
Received: by mail-oi0-x22e.google.com with SMTP id s198-v6so22175200oih.11
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=O4sBN4E7URXI+idCd2IkGK2VSgp9+Su6N2RIq1vS/38=;
 b=Z978646fhtLuXjuPyv0V9J2hu1dAcNtwCGzj2lpwheslA0LHRA7B9B+bemR7Sbpe+R
 cA6zDAWuEHGmOc+yLVQfGwwomwRmy4yaO+7JSMUvd4pDy+jf3jN3NHBCIzDNA5NZg3UF
 2Gd07Wb6CX+gvUtgWtnKS2MUnZM2XQYGm5/wqAgjs0vWlbK1hxWjsPqaCTUX9IIl0Dmf
 cBYOPU/9T+/tGWtjOA5JIbQZuPhd+drAIEJqgpH/cYH0zXcYE3rIjwAtm5r+KZC2lpDy
 nXZce22nuN3G9O/FInIYatrxCWe/1Q2p3fPXJtdP2CgugQodcuQ2mg7MFvXc+NLRYW/A
 ogWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=O4sBN4E7URXI+idCd2IkGK2VSgp9+Su6N2RIq1vS/38=;
 b=all/4CXUCtLVnc/mLJuibn4k/gaZntq4UIkT43gcQ4TWgfYNBffzs4gNMbcBcLrGrI
 dQ1fbIeNWVe2Q6JzHvRUOy9VU+zRipBfl2k8NO8NXZrGYOcDumuHC1yIh4EjsLqDsojp
 9A8fC2CGbt1OQV9l/1onfDVYNI5UKysxEpHt38KXwjos2ar5FCXxngpYUJld1i1uCjFe
 QjxOytXRgDIiKXPQbLFjaoSnaYOTdIB1d+HrPuc0oyHvF/QbHL90KiM8n6ooZ7yyN4Dg
 8ftV8qC0IqtoKAxY+D4BhDe/DTgOU/sHTEbY91FgWCB39PGwqZWFg8pAIkqTCNXL1Hbi
 32kQ==
X-Gm-Message-State: AOUpUlEKzDEwyf7cuKtZcSWwsYFmZWybCj0rgsN9e444jPkY8FYsJQRp
 6JeJNE2EHEySlajl2nL3Bbc=
X-Google-Smtp-Source: AAOMgpeON9pRbAkRQnMA+LReePw0TZCJE/7EES2T2zgUORu2pErb0Q+OT2sfadYNBcT9Khk1neADIQ==
X-Received: by 2002:aca:4d0a:: with SMTP id
 a10-v6mr2840998oib.175.1532102306464; 
 Fri, 20 Jul 2018 08:58:26 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id i204-v6sm3118968oia.41.2018.07.20.08.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Jul 2018 08:58:25 -0700 (PDT)
Subject: Re: openbmc test work group - wiki
To: openbmc@lists.ozlabs.org
References: <OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <d8ebd772-7566-cd23-28f8-b2e98982f2c7@gmail.com>
Date: Fri, 20 Jul 2018 10:58:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="------------9E23DF8272B87F573CA38F0C"
Content-Language: en-US
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
X-List-Received-Date: Fri, 20 Jul 2018 15:58:30 -0000

This is a multi-part message in MIME format.
--------------9E23DF8272B87F573CA38F0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/18 10:47 PM, Sivas Srr wrote:
> Hi All,
> Have https://github.com/openbmc/openbmc/wiki/Test-work---group created 
> this page in our
> wiki for upcoming test work group. Please review and provide your 
> inputs / raise questions if you need any clarification.

Thanks Sivas! I'll join and help however I can. When would be a good 
time for a kickoff meeting?

It looks like the initial list is a good summary, where do we start, 
what is the most painful thing to fix? Also, is there room for remote 
(third-party) CI testing in this WG?

Kurt Taylor (krtaylor)

> Sivas R. S
> E-mail: sivas.srr@in.ibm.com <mailto:sivas.srr@in.ibm.com>
> Automation is good, Identifying Defect earlier is better always
> 9902233500
> 08046678273
>


--------------9E23DF8272B87F573CA38F0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/19/18 10:47 PM, Sivas Srr wrote:<br>
    <blockquote type="cite"
cite="mid:OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Arial, Helvetica,
        sans-serif;font-size:10.5pt">
        <div dir="ltr"> </div>
        <div dir="ltr">Hi All,</div>
        <div dir="ltr"> </div>
        <div dir="ltr">Have <a
            href="https://github.com/openbmc/openbmc/wiki/Test-work---group"
            moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/Test-work---group</a> 
          created this page in our</div>
        <div dir="ltr">wiki for upcoming test work group. Please review
          and provide your inputs / raise questions if you need any
          clarification.</div>
      </div>
    </blockquote>
    <br>
    <p>Thanks Sivas! I'll join and help however I can. When would be a
      good time for a kickoff meeting? <br>
    </p>
    <p>It looks like the initial list is a good summary, where do we
      start, what is the most painful thing to fix? Also, is there room
      for remote (third-party) CI testing in this WG?</p>
    <p>Kurt Taylor (krtaylor)<br>
    </p>
    <blockquote type="cite"
cite="mid:OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Arial, Helvetica,
        sans-serif;font-size:10.5pt">
        <div dir="ltr">
          <div class="socmaildefaultfont" dir="ltr"
            style="font-family:Arial;font-size:10.5pt">
            <div class="socmaildefaultfont" dir="ltr"
              style="font-family:Arial;font-size:10.5pt">
              <div class="socmaildefaultfont" dir="ltr"
                style="font-family:Arial;font-size:10.5pt">
                <div class="socmaildefaultfont" dir="ltr"
                  style="font-family:Arial;font-size:10.5pt">
                  <div class="socmaildefaultfont" dir="ltr"
                    style="font-family:Arial;font-size:10.5pt">
                    <div dir="ltr" style="margin-top: 20px;">
                      <div style="font-size: 12pt; font-weight: bold;
                        font-family: sans-serif; color: #7C7C5F;">Sivas
                        R. S</div>
                      <div style="font-size: 8pt; font-family:
                        sans-serif; margin-top: 10px;">
                        <div><span style="font-weight: bold; color:
                            #336699;">E-mail: </span><a
                            href="mailto:sivas.srr@in.ibm.com"
                            style="color: #555" moz-do-not-send="true">sivas.srr@in.ibm.com</a></div>
                        <div> </div>
                        <div>Automation is good, Identifying Defect
                          earlier is better always</div>
                        <div>9902233500</div>
                        <div>08046678273</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------9E23DF8272B87F573CA38F0C--
