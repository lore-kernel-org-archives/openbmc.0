Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VA7o87d6"; 
 dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 441Mcd45d3zDqQ1
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 05:44:33 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id i5so18150749oto.9
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 10:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=DzwiAirDAg25ZwRRjNfLhQPX2Wc9Sgkusas5ii8WcSA=;
 b=VA7o87d6n5n2U+d+Hexwifg6ARGjHDRisFYajAZdLSxEUG/ICzH85rZz/IttwSfNAU
 JwygIPFPA7uVj4P+f6CmCMT2xms1XabHVwkTwM2LoqeJG/V1asjDNEeC0zTaUAreHS3k
 GGHm/W4BKxCnOWfbgJ6UJjZvUw9XfU+Fx/pLbK8lnff35ktcN7p+ZFBTFvWhPy2J1bex
 PGvLLtJhehExLdo4/EeaWMZOLt057fMN2/cCkKfn1p/atAGMi9sbONZQoTNe5oKy5S7F
 G5K6evJcF0TMoxM5dyQG/cCXCY1+78rIIsXdD0JUvg9eCctC8+lY2asn9U99m6nQrE+z
 tTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=DzwiAirDAg25ZwRRjNfLhQPX2Wc9Sgkusas5ii8WcSA=;
 b=dqZhdjXBU6B1fSfdKvPqhYaTystHZwq6Sn+FQwqImcBQANme+ATLIRBRHaZjX8UwVe
 tdOHuuKIiDqpKoQ3vF3r9VFtziAIY+kPktTwvr3pAQbhSo0toDgszjrHtPEEQ/ZnixqU
 gICGww3XGRyAy/KStMr1FEjQNCuy7BGAj5RwoKziUQ+RLhbLpAAOyeQM+he4Nt6ASwUO
 AVaFWlUVkFdw3jkZWcUHGhgSd4vZo57IyFRv8YvDfQolHx1LW2/bRxCy9NU599WXro3E
 kzYPGWMGU9pifYANLmdbJfzC/u0z0a3BkQSNyWCTGGgRbtvXVEr/k9RX5QczzLoYEbVT
 sveg==
X-Gm-Message-State: AHQUAubeL2O/AN1WFa+CLM6eQKFcjbav5qf76uJKDZxio86sklSaRE9P
 3A503jalYxoKfHhjAOMSbBvdwVVk
X-Google-Smtp-Source: AHgI3IYmBH+z2Pu30Ep24FUQJ8QtkcF6qDhkYt1P6AEh84SjtPdRNCi/qDc67GA0NdH2JfZk0LTN6A==
X-Received: by 2002:a9d:2387:: with SMTP id t7mr6495096otb.68.1550256271076;
 Fri, 15 Feb 2019 10:44:31 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id h16sm2458671otl.29.2019.02.15.10.44.30
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Feb 2019 10:44:30 -0800 (PST)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 2.6 Release announcement
Message-ID: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
Date: Fri, 15 Feb 2019 12:44:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
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
X-List-Received-Date: Fri, 15 Feb 2019 18:44:35 -0000

I have not been successful (yet) in trying to get access to our 
openbmc.org website for adding things like announcements. So, I created 
a quick release announcement on my personal blog to spread the great 
news about all the hard work that went into this release!

http://www.kurttaylor.com/blog/2019/02/openbmc-2-6-release/
or
https://twitter.com/kurtrtaylor/status/1096473964350791681

Kurt Taylor (krtaylor)
