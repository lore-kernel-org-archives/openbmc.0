Return-Path: <xow@google.com>
Received: from mail-pa0-x232.google.com (mail-pa0-x232.google.com
 [IPv6:2607:f8b0:400e:c03::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQYs174XFzDqV3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 04:35:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Z18CwBqu; 
 dkim-atps=neutral
Received: by mail-pa0-x232.google.com with SMTP id b5so15539898pas.3
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2016 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=references:subject:in-reply-to:from:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=4wPeXlWenaZvjfD8pLHHU9up2LKxyxjNy+tudYWxn1I=;
 b=Z18CwBqu+nu0Y2fpp+RM9zQX8JtuKYkSDaHJ7wXxhORnu4gXWLEC9ExIzwGBgHIX/Q
 UEfTQtXflGClECR/4UAFEx+d4knwBu7qxTC0jx1k3RU2aYkoUO9CB1HAF044ZaSuYeT6
 GndQI+lWeurX1ZKX4qLt06orF5jOmgmFapc0aU+PJUBdrJaoZScM1O/ZIa2/wHgn00oV
 XI6yZ5CtYoxXR+k4QWBzL9f0+vAxIeCW77LBmuvLTn0g1g8oCxIjtrhznezXczncS3ht
 Chgv/fdEqG5I83pw0mdqlaqf1vmFkL2em0xl/0Hnfy5Fd0/NF1LFzmMGafRI1DkZmPrj
 tSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:references:subject:in-reply-to:from:to
 :message-id:date:user-agent:mime-version:content-transfer-encoding;
 bh=4wPeXlWenaZvjfD8pLHHU9up2LKxyxjNy+tudYWxn1I=;
 b=NnJP8edCgluQ6NyGc0J2plfcOjCCvpVtTKfHMUqAAoQvYwQjHjfCxQ3IbuF8O6TzKw
 HAjucYtgq8xbnZWLWTy41V3rn2KQq96plgpqkA/HDKuWhw7YxHbX1G889kaooUXj2pRl
 1RS996NpFwXaZEx5rWMsH8QnBReNdCEeROOJfVkfw/ElHDe96u94G9v4cfldQ/6Bh4jU
 5pTSn/9kDV1A6wcJp6bnisuXAaN73sOuX0t/0VGrQTZxAeWJJsAFALAygiinz3XG0qNl
 0VlhGYZLBoKQ2f7PEEhrtoWzXc2c1JP5gkNAV0QvG3dB5OlhrQP5DLKH8stLO/LqGAEx
 RdJA==
X-Gm-Message-State: ALyK8tKrKvmzd/Vq3UaLAKa2BWKM8i6AXUJcRW32Nd1EvFhSwlGxMqJen4hbtop+DmRDUkbh
X-Received: by 10.66.157.193 with SMTP id wo1mr14021522pab.116.1465497328528; 
 Thu, 09 Jun 2016 11:35:28 -0700 (PDT)
Received: from pewter.mtv.corp.google.com ([2620:15c:202:0:30f5:ab50:e8a:8e4e])
 by smtp.gmail.com with ESMTPSA id v62sm1477510pfv.50.2016.06.09.11.35.27
 for <openbmc@lists.ozlabs.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 09 Jun 2016 11:35:27 -0700 (PDT)
References: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Subject: Re: AST2500 support questions
In-Reply-To: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Message-ID: <5759B6EE.3010700@google.com>
Date: Thu, 9 Jun 2016 11:35:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 10 Jun 2016 05:19:00 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2016 18:35:34 -0000

Hi Shay,

Aside from confirming that AST2500 support is still a work-in-progress,
I wanted to answer your question about the current device-tree boot 
mechanism.

 > We tried to boot it with uImage and separate DTB image using the
 > command 'bootm <KERNEL_ADDR> - <DTB_ADDR>'

If I understand correctly, the configuration you tried is to load the 
DTB at 0x82000000 and pass that address to a CONFIG_OF_LIBFDT kernel in 
register r2. This should work and is probably considered the 
preferred/idiomatic ARM way, but not how the phosphor build is doing it.

 > Which u-boot command do you suggest for booting with DTB file?
 > How did you guys managed to boot?

The current OpenBMC boot mechanism for AST2400 that we ported to AST2500 
is to append the DTB to the zImage:

   # meta-phosphor/classes/kernel-cuimage.bbclass#L32
   cat linux.bin $dt > linux-dts.bin

The recipe will then run mkimage on this to create a u-boot container 
wrapped zImage+DTB file called cuImage. The kernel knows to look for the 
appended DTB if built with CONFIG_ARM_APPENDED_DTB.

 > ast# bootz 0x83000000

I think this will pass a pointer to ATAGS in r2 and bypass device-tree 
handling completely. ATAGS is considered legacy and isn't usefully 
populated by the OpenBMC u-boot, except to pass kernel boot arguments.

cheers
//xo
