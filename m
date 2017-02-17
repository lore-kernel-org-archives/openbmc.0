Return-Path: <raltherr@google.com>
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPmlb6D2kzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 19:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q3Q0fGmA"; 
 dkim-atps=neutral
Received: by mail-it0-x236.google.com with SMTP id h10so11522636ith.1
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 00:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8kaV0xOfqJcm44xEKm9am1irjYAPdpIwf7umd7eb1r0=;
 b=Q3Q0fGmALZACVP5PwjI5JCtqw0Nw9iRzGUAus/WvExs7sd+yeBoBvJGaWHa/C1uQJr
 iGMCTJKAxpKW8CX7vfxYCPsgN32M0p/s/BYHIAojExhetQROwKVzfzRl3S6d7eMYYqTB
 j6scv8RClOKEF5cBqzz4op5ZhiA9tnrASe7t/9xjBaWGOYWrkCXEDVdhOJ1YpKz7aHZ+
 N2XNZSClUmG4+YSfo9zE1SNvkPh8Llbu6p6y8TLcQINREusEOHtmwJwz29PjHr8a5yAX
 yvwputYJhTGcIwvRpqN8nkleCen5ArnUczL1gmYr6UE9cAyE3S81x1GsnQFqdq2N7vlw
 nifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8kaV0xOfqJcm44xEKm9am1irjYAPdpIwf7umd7eb1r0=;
 b=VsRKbc/PVvIrYHogwaUnKQ7o5E1S2mmm05KxDAjLdgVjsyQ1ez8Aiahf0qzp85LB+B
 AzzfV8k0N5irW7OVlEvtoDlJw/NmewZazhQRbEKthcPZtwK8xbD9cDg1L0WKK1qkvcNr
 CxKR9o983P2QTa7ybeEdEnra6JpBkcciC7/SmCnx02u7KFHjRD12MNY6mWRON1wak7Xk
 4e2Pr9SuhWBOJ9v2PlK82vUnugiPQEm9PbbN3SaSJnxzu5kM8nDhZGPGpO+U4pfEhe19
 DglH1xD47rgAGK62A30ynN+K7lWGWfNd314aDMaYY1E7Wbwjt4drj9PECY4Z98VcbFO4
 JlBw==
X-Gm-Message-State: AMke39kZWQ68vb88/ZDWM8gzebsmyQsBdwb09+w3ZF4QP48V5+1m/QoFcHSSYEndojnb7+G43otYIuseTMxZbENs
X-Received: by 10.107.172.7 with SMTP id v7mr6608021ioe.49.1487321033380; Fri,
 17 Feb 2017 00:43:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Fri, 17 Feb 2017 00:43:52 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
Date: Fri, 17 Feb 2017 00:43:52 -0800
Message-ID: <CAPLgG=knxssXnbpteDb=MbWUubxX5e3deUpN_qTTYrODBdGYpA@mail.gmail.com>
Subject: Aspeed ADC driver
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c05a380dcfbb60548b5e916
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
X-List-Received-Date: Fri, 17 Feb 2017 08:43:56 -0000

--94eb2c05a380dcfbb60548b5e916
Content-Type: text/plain; charset=UTF-8

I've finished cleaning up my Aspeed ADC driver and it should be ready for
upstream.  I'm headed out of town for the holiday weekend so I'll wait
until I get back to send it upstream.  In the meantime, I've pushed two
branches to http://github.com/kc8apf/linux.

ast2400_adc_for_upstream is just the bindings documentation and driver
based against upstream's hwmon staging tree.

ast2400_adc_openbmc has cherry-picks of upstream hwmon changes needed by
the ADC driver, the bindings documentation, the driver, addition of the adc
nodes to aspeed-g4.dtsi, and an updated dts for Q71L including ADC channel
labels.

I've booted the latter branch on a Q71L and verified I get sane ADC
readings.  I'd appreciate if someone updates aspeed-g5.dtsi and verifies it
works on a AST2500.  If all goes well, I'll submit to upstream on Tuesday.

Rick

--94eb2c05a380dcfbb60548b5e916
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve finished cleaning up my Aspeed ADC driver and it =
should be ready for upstream.=C2=A0 I&#39;m headed out of town for the holi=
day weekend so I&#39;ll wait until I get back to send it upstream.=C2=A0 In=
 the meantime, I&#39;ve pushed two branches to <a href=3D"http://github.com=
/kc8apf/linux">http://github.com/kc8apf/linux</a>.<div><br></div><div>ast24=
00_adc_for_upstream is just the bindings documentation and driver based aga=
inst upstream&#39;s hwmon staging tree.</div><div><br></div><div>ast2400_ad=
c_openbmc has cherry-picks of upstream hwmon changes needed by the ADC driv=
er, the bindings documentation, the driver, addition of the adc nodes to as=
peed-g4.dtsi, and an updated dts for Q71L including ADC channel labels.</di=
v><div><br></div><div>I&#39;ve booted the latter branch on a Q71L and verif=
ied I get sane ADC readings.=C2=A0 I&#39;d appreciate if someone updates as=
peed-g5.dtsi and verifies it works on a AST2500.=C2=A0 If all goes well, I&=
#39;ll submit to upstream on Tuesday.<div><br></div><div>Rick</div></div></=
div>

--94eb2c05a380dcfbb60548b5e916--
