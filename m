Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4HGw49lkzDt3H
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 17:36:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=UgaQSJhe; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id n202so30677910oig.3
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=nJTkXZ8mwVkESVw3a+UtgB9ADCOcXizfWUoQrPtjCCQ=;
 b=UgaQSJheYpz6d0C8ExCHvNEKN0uCYe7i+iQ09DXlkPSi8ZGNx4v72go0+vnpwDOnQO
 wqO7qyKFpmG6Hq2ehZc8Qt1BdbdS9rLQWn4twvW0sbO7R9PUTXQar5xjj6DcDTj3LRqg
 hBd7lMDd9XxPFg90BwSuN3C0Fud35MicdYIiJVZXPUZmpPyQON+Nm/3taqk4MwsDp+YV
 xvMxeWYCCz9BZhKsfD2iel1uR6xGHfUqp5yb0YP870ctl696nggppz63RCxX4nstPIio
 TOqPjDKL2zF3fucj7X63DK6K0am5MQyk9vyNjik5hxnTTWJZpDbEnNDHuHrq4hGhEyB0
 0D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=nJTkXZ8mwVkESVw3a+UtgB9ADCOcXizfWUoQrPtjCCQ=;
 b=Dw3P3qZRWk5XsrfzAjloQ20cPKp/Zo63bCGhhThUSuV5ihc1lEgYWF/OyBVSGTfBFT
 lW/0VZN/HfyAIOAsrs6duD/PpFZi0Vq2teuV9JT0ltCBWaN404DFCon7vnQOkGwM6zpX
 hZpraOYoW9KxZUorLzR/MQhvBn6z3zdgqctMVduIeWjddQC0gNI93/LPsCM2D8+7r7Yi
 ozkMGHo3sAWyotkZN26tPaiARW4sr8Rb/Ybz23wwwDj2Vqdp6+5RmKtB5Qz3mKhQI54H
 jpYWF1AF5W8IOM5jZOg40ziH9RWRZKxN6qiY+9JG8EaTbXjGVi+qhiJnwPDMw/U+g/n6
 34pA==
X-Gm-Message-State: ABUngvcwLLiGz46qHyK5x2gfyVAhQTgCm2FMdZvmQY09UVPvMKo+RP5ECLZfhBuy9igRnOmofCjPhBAvf8DnpQ==
X-Received: by 10.157.41.101 with SMTP id d92mr4917374otb.165.1477550198591;
 Wed, 26 Oct 2016 23:36:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 26 Oct 2016 23:36:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Oct 2016 17:06:18 +1030
X-Google-Sender-Auth: JDlaJb8IKxyjzg4jU6NBGfEjsMU
Message-ID: <CACPK8XeEiMremm9nbKRMxr3G6GmR4OTHjb1DHOxLjPqQ3WNBkg@mail.gmail.com>
Subject: Gerrit emails
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2016 06:36:41 -0000

Hi Patrick,

I think you mentioned that Gerrit emails broke a while back. A few
people have asked about it recently, so I was wondering if you could
update us on how that is going?

Do you need help?

Cheers,

Joel
