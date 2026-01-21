Return-Path: <openbmc+bounces-1262-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB0CD2629F
	for <openbmc@archiver.kernel.org>; Wed, 21 Jan 2026 02:11:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwnk61Tt0z2yFg;
	Wed, 21 Jan 2026 13:11:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768959795;
	cv=none; b=iR+PyITJvBnYVRK9AAw61gbOYouNKyyfNBRuqo4+Hwk7tQ/0DagPC2+Px8QJnFukNSLRvt/U6DFbBo8FYt6mhdDI2OT6ZSbHk6vwyxvgvneakh0JoL6sfAe6SSDYKkPLi+K3dh2sjSc6oqlt8/5yqLhmwz0FIVsqY+YN/iu3ESFwo5B2+IVxeN+s9O1O9s978myWw5uGjfCoY/Hf0CzIqyg6DY+CoweKbqhLqhwA+7CZgi2bvMh53LAshPfEr1haIq8HtcaOD/A6YxMZ5zyHOa2H1R25fW5WsTNhyTi34LisSqF0M/TyqqYBCcHR083ziN7t0BEA743WdFkXCfMpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768959795; c=relaxed/relaxed;
	bh=AkhwBkoPexo6KnbInk5yJ8qfwJ3nLbjN4I2ZMj09FO4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Cm1He9TCLwQCUGQ9Wum2xgAydN/4vkcZ0iDwdn4YUAA7fJfcphwvqnCbsq1xGB2m1MDYnxbptD/XM7BRewV97cE4c50jKvjI2+H+l9TayFNWcbUvgvTiXDqMniAXzCd+3wDn/3Sw9xo8lXZMNJuqmPNT9DIzji6BYZjf3pre56bCUZi5N1pCIDPBWpuU19imicG3fIY6LBG4xrljWX1AZR3KfcQcMY3ruMMj+O77qumLIJ8onAC5SW7vhDs0LnPw7BUgmVdV0eEExLaCc0nTaikqz6RwcMkxeNwsbIwkd1/SHISKea3DuFgCktGz6ojgMTThOZswl5er0DltqVpmiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fwDQEn1A; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fwDQEn1A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwn5Y4SHQz2xpk
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 12:43:12 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-352c5bd2769so895633a91.1
        for <openbmc@lists.ozlabs.org>; Tue, 20 Jan 2026 17:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768959790; x=1769564590; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkhwBkoPexo6KnbInk5yJ8qfwJ3nLbjN4I2ZMj09FO4=;
        b=fwDQEn1ALXiKIQyFv8GwPFO00IBpjhM/gVWXmnCn8jfq4qhnQ6ZF/4j3VxYuG3DHsK
         Zkd/ejyPub9PovIeRLe1pV9++9xwUFpZxu/x+ozD93xiHKAaiSn+SGsRXZqYRHocHyYf
         2Nqn3zWWpicd6biyKUIQ57T9XYNPWbffXJRgr47E0HkvEIr2Cqf2Haqyyaph9gBg8t0J
         Th4iIJvgWzCzzl//UndD+eR2RXKVAg1hEmZZLzJlW82wxWEgxZ4xTghr+hf7AZN3TuiI
         3m+LjNJsqxxjDQoASYRi0M6rX/gT2IiaqcXvyvxHr36BUJkQYemRDmkKqek/zDBNik/j
         YspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959790; x=1769564590;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkhwBkoPexo6KnbInk5yJ8qfwJ3nLbjN4I2ZMj09FO4=;
        b=FQn9u099+j/0u2adlNfOzmg373eN56Sv7moqt15aiHRnLFFOIBLExsmK2615nEaN+O
         vmZjF1tC6LyK9fauVypsQtVaA32IurkO1bw6EWRy8CBAHqBSX0zJE/J2bvk8zUPHC1vM
         FGTPeE9EBXeijNk+YP4NzBX9oEVTL72w7DJ/ctHTZfx9Y3UsL+u5XyS/tcKrwPgj1UXj
         gPtupg5rMyBCSuhvN+xj7Zds9quelLm3R3MMOj8oFYzfR7uAcgJNjzitLlwRmhFVWJn8
         XH5IXHaW8lMpQ1bSP25k2+fGO/rwoHvFY24VWifRCXMU70cE0/cP0W3cqC84ChxE4QHI
         Lwkw==
X-Forwarded-Encrypted: i=1; AJvYcCVm8FcR4KMmzbpfNz0JlQ/Im90tMNxqXdIqGk9Dzo4zhELyT00jR48CzbeiKxdIEBpmaJTM1H9Y@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzdki/NHrUJ7beTNgo7mSAWq/HnIMaPUkUMiM7VG4xAPUdTlN2K
	9x4aOzTUvY6YWMYdvPkQY2nn/22zF6WklkJnFwMETTA295vQSdAzLBDn
X-Gm-Gg: AZuq6aLJe6TdaArdULPhre5QlCoYf9qCH8hCMOLedCQmVveBvA0+eu7yP12h3n5Kygv
	y8LgE9QtpBBtTADoagV9BmGA33bDQE4mnqwXNMlosQOv0yCnCDxvkpYlqzgbMt+ZI4cqZUFT42b
	FjoKQe4wMQwaTx8KZM+ZE7x0kIYFCd2Bt08nt7jtF7HZP+vGt4gYtK2kohq3RsfpXmlUq9z8ZHO
	4tMP2HX3acr69KAPR99QAzRW/F1yzynRdE+LWwIiBM2OnnLfW0w0u1K4uDaKy+6fIONp0YV0Hld
	Z8Efx00k8IptxpMhYZy5qGVwvfVMQwHtxjqJaLQoFzY3S7OnSb3DAULfNkoezMesFwmJSEmEu/J
	MXJem/bFzOOou5XmW3P1SJ1tEjNAn3HJyjuPf55532lx2YO7P1jMZsmkZsMJD1sQ1VxToZlgE0/
	Rs9qadU2z17YHogJgzIaK0DhtFBv4PpiWKpyRyV/u0BERBOHQprDvypOTJIY0BEK2S
X-Received: by 2002:a17:90b:2549:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-352c3e84027mr3169791a91.3.1768959789946;
        Tue, 20 Jan 2026 17:43:09 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35272f4a9a1sm13069177a91.0.2026.01.20.17.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 17:43:09 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Q5WIQZLzjt3O9swZHs9BTXXB"
Message-ID: <7076b491-9d56-47e0-8e2b-ef12a29b6419@gmail.com>
Date: Wed, 21 Jan 2026 09:43:03 +0800
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
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
 <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
 <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>

This is a multi-part message in MIME format.
--------------Q5WIQZLzjt3O9swZHs9BTXXB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Andrew Lunn 於 1/21/2026 6:10 AM 寫道:
> Does ma35d1.dtsi represent the SOM?
ma35d1.dtsi describes the MA35D1 SoC and its integrated peripherals only.
It does not describe any board-level components and is not a SOM 
description.
>
> If so, what is ma35d1-som-256m.dts ? It looks like some odd sort of
> carrier board with a few serial ports and some memory? But systems
> like this put the memory on the SOM, not the carrier.
In our hardware design, the DDR memory is part of the board itself.
For the SOM-based product, the memory resides on the SOM module; 
therefore, it is described in the corresponding board .dts file.
Although we use "SOM" terminology internally, from a hardware and device 
tree perspective these are single-board designs,
and all |.dts| files describe complete boards.
>
> As i said, i'm confused with your naming here.

Best regards,

Joey

--------------Q5WIQZLzjt3O9swZHs9BTXXB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Andrew Lunn 於 1/21/2026 6:10 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">Does ma35d1.dtsi represent the SOM?</pre>
    </blockquote>
    ma35d1.dtsi describes the MA35D1 SoC and its integrated peripherals
    only.<br>
    It does not describe any board-level components and is not a SOM
    description.<br>
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">

If so, what is ma35d1-som-256m.dts ? It looks like some odd sort of
carrier board with a few serial ports and some memory? But systems
like this put the memory on the SOM, not the carrier.</pre>
    </blockquote>
    In our hardware design, the DDR memory is part of the board itself.<br>
    For the SOM-based product, the memory resides on the SOM module;
    therefore, it is described in the corresponding board .dts file.<br>
    Although we use "SOM" terminology internally, from a hardware and
    device tree perspective these are single-board designs,<br>
    and all <code data-start="2948" data-end="2954">.dts</code> files
    describe complete boards.
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">

As i said, i'm confused with your naming here.</pre>
    </blockquote>
    <p>Best regards,</p>
    <p>Joey<br>
    </p>
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------Q5WIQZLzjt3O9swZHs9BTXXB--

