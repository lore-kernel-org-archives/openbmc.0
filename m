Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C7C4345F
	for <openbmc@archiver.kernel.org>; Tue, 30 Apr 2024 06:58:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT9yS5dykz3cTL
	for <openbmc@archiver.kernel.org>; Tue, 30 Apr 2024 16:58:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 507 seconds by postgrey-1.37 at boromir; Tue, 30 Apr 2024 16:57:52 AEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT9xr3yGrz2y70;
	Tue, 30 Apr 2024 16:57:52 +1000 (AEST)
Received: from [141.14.12.201] (g201.RadioFreeInternet.molgen.mpg.de [141.14.12.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AF12B61E5FE01;
	Tue, 30 Apr 2024 08:48:10 +0200 (CEST)
Message-ID: <a21672d7-82dd-44a9-b301-94aa1537b75c@molgen.mpg.de>
Date: Tue, 30 Apr 2024 08:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] modify Signed-off-by field
To: Kelly Hung <ppighouse@gmail.com>
References: <20240430045853.3894633-1-Kelly_Hung@asus.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240430045853.3894633-1-Kelly_Hung@asus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Dear Kelly,


Am 30.04.24 um 06:58 schrieb Kelly Hung:
> For the warning message:
> From: Kelly Hung '<ppighouse@gmail.com>' != 'Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>'
> 
> I replaced Kelly_Hung@asus.com with my private Gmail account.
> 
> Due to a security issue with ASUS's mail server, I am unable to use
> ASUS's mail system to send patches out from my build server.
> So I executed git send-email using my private gmail account.

To put light on ASUS’ upstream work, using your company address would be 
nice in my opinion. Do you have it configured everything in git 
(`~/.gitconfig`)?

     git config --global user.name "Kelly Hung"
     git config --global user.email Kelly_Hung@asus.com

Then `git format-patch` and `git send-email` should put

From: Kelly Hung <Kelly_Hung@asus.com>

at the top of the message.


Kind regards,

Paul
