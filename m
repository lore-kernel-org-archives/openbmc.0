Return-Path: <SRS0=qcYX=DM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5E7C4363D
	for <openbmc@archiver.kernel.org>; Mon,  5 Oct 2020 14:22:21 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97472078A
	for <openbmc@archiver.kernel.org>; Mon,  5 Oct 2020 14:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAn22C/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97472078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4jV15wgXzDqH6
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2020 01:22:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dAn22C/E; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4jS61bY4zDqDJ
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 01:20:37 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id u17so2666932oie.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=8Ep+0+ZhMEZuiB9S0xCMwdJQ+xNxRG33W8OyITnhL+E=;
 b=dAn22C/E85EDxBYcGuT3g67OaqvscazFcx41sBFDqok/ZFkH3j6/Cd8aa27W7DQQMg
 U0e7Mza4sFX2NnrVrch9O/FVCTwGTtFNaStsmKliJNfcWSLrKy8YThhJzyjRTw6yQJi3
 K+m2bHtwGwmU31CENHhNqDR0s9bKTiACScMOUVOFMwnBlXpWtEIGa4+EKXr9M0INY4g3
 id4zTQtIeD8J4PO+ewIr8AUsVpx4LBJhOMyhbSeYbdIhfOR7JD6RMeA97cD7syRt2HzK
 XLLKsfOH6wVYwhC+lNnUM9M7/jan3WsGL/rVUgA/0GSa41fjBlNRgor1d48/qETNPFJ/
 yk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=8Ep+0+ZhMEZuiB9S0xCMwdJQ+xNxRG33W8OyITnhL+E=;
 b=a9gnS+BGAhs2xC1ikUpuXDg7CYO6GxsgwyJkP2z4B1aFFvZwlXfhApjSrONjpwa62P
 Snx5Ilcy/6DGoaWgQL/77mzkiHLJy1hl2N5B2IrvnuarfyqSO3h7bHBRI5yAz0f9ojkY
 TIN9PWz/VXs0wkRmNEcIGiO25736+wTbw6QAGoW1dpA3IxYuDYlgqqykxbXZyUIfmYr/
 HIzG057lcP7yIdiyfCHfV3lqxAhhs1ki+etv9bgP+nt3+aKAQ31ir+SXZkChrzTt7vVK
 fNYKYNUldjZTBA1+6c4Ph6VDQ1TGhY60qfJTqOQUwehJyPns/fWNkVHkL6ms0hdfpn5J
 IMrw==
X-Gm-Message-State: AOAM530JUnduVWoyftOXZZd6ifQzldNYq0QnL1RrUVBpv/Rie0srmSDA
 0SUKSCNkRexrq8StOvZAVSKEyuu+yyXz8w==
X-Google-Smtp-Source: ABdhPJzxiRnciC+NE8sRFkLho0tlZ/l0NXaeAnzafXTGCHdF99EHhE/1Z0LpH//ZzGaL7OPiacRCng==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr8249098oif.133.1601907633566; 
 Mon, 05 Oct 2020 07:20:33 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id a82sm1351587oii.44.2020.10.05.07.20.31
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:20:31 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: OpenBMC community messaging survey: Results
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <bb565e15-f5a7-b0b2-d987-41b1a5e9acbb@gmail.com>
Date: Mon, 5 Oct 2020 09:20:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Thanks everyone that took the time to reply, 20 people took the survey. 
The results were pretty interesting!

https://www.surveymonkey.com/stories/SM-TNP9XW2Y/

Survey-takers found IRC confusing but would communicate regularly if it 
was with a different tool. It was great news that no-one felt like they 
are being discouraged to communicate what they are working on with the 
community!

I'll be doing a follow up survey, I'd like to understand interaction and 
communication tools a bit better and open up the audience.

Thanks again everyone!

Kurt Taylor (krtaylor)
