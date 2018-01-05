Return-Path: <quochuybk2010@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::235; helo=mail-io0-x235.google.com;
 envelope-from=quochuybk2010@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RHJNPk8U"; 
 dkim-atps=neutral
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCYnL5knNzDql5
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jan 2018 16:56:06 +1100 (AEDT)
Received: by mail-io0-x235.google.com with SMTP id t63so4664561iod.0
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jan 2018 21:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=tbDdYwCwR6qaxUWZ+/zOyj/Hkni+u68AAn4RjlHoyk0=;
 b=RHJNPk8US9ikAbLsepG1zDpiyq3QI/gqCgvR21W1zWm/a3FG26Ptt9HIgJ76797y63
 EehR99oG8rF3ToWEWqzOA+0KN9sY/Q6dcFuDnwInHqnUhLS+HcW4CxYpdI9zya0pmcvW
 BotJvMEq5FFFQZ87seJNngp4tD4P3lw2gwQ5XnI0qQK25eu0FyTqg/ukIbdKLaU43XHE
 6l/mHHpcAAbRO+Qk/8ElcJhLS7HTfLwuGC9Bu9gZL0qZkskQ0n5q2ADJj9ppf/as2t2F
 yDwvElOBB2OMU9Wcvb7M1e+2PrjZX+pmhknn/Wim5gg1VC27Rdrrcv6A8guJee27lXEv
 e7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=tbDdYwCwR6qaxUWZ+/zOyj/Hkni+u68AAn4RjlHoyk0=;
 b=cDZAwh8KT1F2CTDiXq6HXQT88ZhRxzNE7X4c2jQ4sjjDuKlQtEZxCznrlRPgTViQMh
 wFPP3h480nJy74H7i2SV9VlLf441DS8yRgqJocoeTvk3chO6jx3lT1ySX6DIxFqhMl8/
 /QFXyvY1ucibhRCcAO4qQBDU7IhPYP7W9AKVa/EOfVe2dxWFmkdOpsbPX7bFp4QktirK
 Om2yGxrisw61BV6aZgc+d6qGNZabQmPEFydglmI3X2eJGYleFvu/eu+rB2hH92Y9oF/y
 HLRSD4Az7JpLnRsKEemxbNhh0U5/90j78DF46yZPS9pTf5t/fNJ/eBllW7C2ihqK242k
 Piqg==
X-Gm-Message-State: AKGB3mIX2aEdIE3lND+yE7sgItnOtCUUhuM8rA2NvGOnUdwD0kQiEo0e
 phV7r/bBlfnln7kbwT93Q1U0x1pc
X-Google-Smtp-Source: ACJfBouV6i7ef4uR4rKxf/YW5n72nQVzcuwFWAtZb0DSoAWBLZZbC63uopk8SJPzJ5MWQD1gmL+R3w==
X-Received: by 10.107.173.143 with SMTP id m15mr2116619ioo.220.1515131763866; 
 Thu, 04 Jan 2018 21:56:03 -0800 (PST)
Received: from [10.38.6.98] ([118.69.219.197])
 by smtp.gmail.com with ESMTPSA id d14sm2947891itj.11.2018.01.04.21.56.01
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jan 2018 21:56:03 -0800 (PST)
To: openbmc@lists.ozlabs.org
From: Huy Duong <quochuybk2010@gmail.com>
Subject: Enable Thumb for Aspeed 2400
Message-ID: <17364132-2499-fe30-b7e3-935008e8e9be@gmail.com>
Date: Fri, 5 Jan 2018 12:55:58 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------08144EA98C2567522DD87D8A"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jan 2018 05:56:07 -0000

This is a multi-part message in MIME format.
--------------08144EA98C2567522DD87D8A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all,

On Aspeed 2400, /proc/cpuinfo shows that Thumb is supported. But look
like thumb is currently not enabled in Yocto.

I tried to add "ARMPKGSFX_THUMB = "t"" to
meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
and see that everything still works well.

Is there any reason why Thumb is not enabled by default? I think Thumb
can help to improve performance a lot.

-- 
Thanks and best regards,
Huy Duong


--------------08144EA98C2567522DD87D8A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font face="Arial">Hi all,</font></p>
    <p><font face="Arial">On Aspeed 2400, /proc/cpuinfo shows that Thumb
        is supported. But look like thumb is currently not enabled in Yocto.</font></p>
    <p><font face="Arial">I tried to add "ARMPKGSFX_THUMB = "t"" to
meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
        and see that everything still works well.</font></p>
    <p><font face="Arial">Is there any reason why Thumb is not enabled
        by default? I think Thumb can help to improve performance a lot.<br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Thanks and best regards,
Huy Duong
</pre>
  </body>
</html>

--------------08144EA98C2567522DD87D8A--
