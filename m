Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJXMt2r72zDrRZ
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 12:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Qt0kbeGg"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xJXMs5gKhz9s3T;
 Fri, 28 Jul 2017 12:09:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501207754; bh=eghEk7qvXfGaiuRj8jLpt0KqY2Sy0cG/WPQu+uqPnQE=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Qt0kbeGgcPqJVPujAx/LJ8AOI6mCpBGfVlBg+Z20E94mFo2XaX16pK6yuGp1sTJ7D
 WTc4eJXztL9KMJ/RRxkyPCvnlo4OhJiVSskApZK/xCeHWepx8EPy17U6zTRzcV/U3F
 obmMxyPf/Cg5Vm8DtVzrFFSsqWsuJv1GCI/AVHPqx1AgTBvPvJ3Gm23baUHWAP6vWW
 HRiZbchT5rIILS3u98vlqeodhLHQN8TAuvaUMViESQIW9P20DhzwG9fGGdBEzVLI3i
 MQvS2B4CmP8dGedlicpkCO/jDNf48QfzNr0igqaerPn2Hr4Pcr/6ybGU1Q+RzFwdNl
 9JD84r/I2BvaA==
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
From: Jeremy Kerr <jk@ozlabs.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
Message-ID: <c946948b-1cc1-a9b1-73d2-ea96808b4bf4@ozlabs.org>
Date: Fri, 28 Jul 2017 10:09:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 28 Jul 2017 02:09:14 -0000

Hi Eddie,

On 28/07/17 10:07, Jeremy Kerr wrote:
> Hi Chris,

Sorry, s/Chris/Eddie/ - I was reading the  CC line!

Cheers,


Jeremy
