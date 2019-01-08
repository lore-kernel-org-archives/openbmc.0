Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UrVvAJZO"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z24r3mqjzDqX0
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 06:14:36 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id i20so4538790otl.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 11:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CSOrYX1IUtxcAMpv9E1gBKW2YLNUJ8lZowd988I1b5I=;
 b=UrVvAJZOgCVGIQURfzo3ZbM2U5jgC33X9g26g7pFZXm+U5NnP6S+rmNfEdsqssy4zU
 bueEu9Nue2TheljcovpS6Jt1jIHVxGQwL/3lJOUfJcohljrF4iPIENl8RwRgm4X1PXDX
 HhtNIRikT07aPxO8rHSaKGBWe0rkrusr9sET/JOm5nKylnKRcyRB+8DkheFCGq9N0dDF
 vQtdSkj5Rv/ZChvQLPRAFbihqhBcZLMSRVkFPwtiK7++5fFtusq1uwjA3dXwqzTouo/u
 ck7ZarUz5FuT62Kv6yAAj6ofEtQ1+ysBY7BSnUQIGD5oT+Zwgunqq386/PhP10VN0FT3
 hckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CSOrYX1IUtxcAMpv9E1gBKW2YLNUJ8lZowd988I1b5I=;
 b=DMSnqo9Mu+DPI4ZDrMbZbV4N2rqw3HCpSVSQF1EvwADPPEw6zuFVlZL+114g6+8TB2
 yHCUurEEaHLyQ6t0CMh42QjsiDh4lsL3Js3QruOGAudZMbxZ1+WNtik+k5MnWmQ1L0eX
 lePQ0Y4pOFuSmNSU9I/iAnQn9ZRMhUzLLSqXfgGqOLYIshKjTxWd4CMmZ9SCAMCAOp0D
 /g1in4XL0ZeF/AEwmmbJGUcAFuyM5xkaBjpG6GMlnBaCJmBBOYuCwjyxOxbzeSiPhO4l
 zb5CJ3u0kSflFR69NCBktI2kce9nUDfPRnod13VGN6WTC3jmHfP0Y+pKPifXbNY+Qyl1
 EVHg==
X-Gm-Message-State: AJcUukcAi2/F1m5WvTHVSbm8xjPqY+QHQRNFEwkNICCMdQsz2rPzGOk9
 8EY7/HHig30qAUXSDKfdvKR5u5zH7jM=
X-Google-Smtp-Source: ALg8bN7pikmlqKoZqEWrZ3BfwUQJ/fRwii5U8xLFetNeRec1jtQTV7EAckznG6447oXC+KRKKyJuHg==
X-Received: by 2002:a9d:19eb:: with SMTP id k98mr1896215otk.205.1546974874264; 
 Tue, 08 Jan 2019 11:14:34 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 75sm65917182otc.67.2019.01.08.11.14.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jan 2019 11:14:33 -0800 (PST)
Subject: Re: Signed CCLA from Wiwynn
To: Tony_Ao@wiwynn.com, openbmc@lists.ozlabs.org
Cc: Matt_Chen@wiwynn.com, ALDOFO_LIN@wiwynn.com, DELPHINE_CHIU@wiwynn.com
References: <A1438FED263F274ABCA8575B907D0E5ABCFBF022@GDC-CLDMBX-P06.whq.wistron>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <00e516eb-e956-e55b-9dcd-79e86a4edacc@gmail.com>
Date: Tue, 8 Jan 2019 13:14:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <A1438FED263F274ABCA8575B907D0E5ABCFBF022@GDC-CLDMBX-P06.whq.wistron>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Tue, 08 Jan 2019 19:14:37 -0000

On 1/7/19 8:29 PM, Tony_Ao@wiwynn.com wrote:
> Hi all,
> 
> We are the OpenBMC team from Wiwynn(http://www.wiwynn.com/).
> 
> We want to join the OpenBMC community.
> 
> Please find the signed CCLA from attached, for approval.
> 
> Many thanks!
> 
> Regards,
> 
> Tony

Welcome! Thanks for signing. Your CCLA has been accepted.

Kurt Taylor (krtaylor)
