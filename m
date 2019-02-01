Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iQNY/Chv"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43rtQ573sqzDqhl
 for <openbmc@lists.ozlabs.org>; Sat,  2 Feb 2019 10:21:01 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id k98so7537126otk.3
 for <openbmc@lists.ozlabs.org>; Fri, 01 Feb 2019 15:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=S0Ueggh+wm/GPd/Mj39vTrcgI17x0hRoe27k1LRVPFU=;
 b=iQNY/ChveOJkV8w0jAGCN2mmWfnXTFjLw3JGaWje0JzU+ItpBm4n6TVv+OwdrtkHMN
 WFX/OMkM1wuYFtnEd9P2BdLC1oe6rdDTddAn0L5i+y/oBJCTY9ynFNq/WsVtZl38fo4P
 f371oyGOXXPCqcp30pGqZSmybPCd1c8Ki8g5BO8jREZbhLeESWSrMVKpa0npOjtq97GS
 Snsop9MfFvOI3x9L9qLYZffgAcvMKJmJrZ55bbi+Q3ImTqltsEjIFE+wbiXvy8B/HRkr
 AQAkHo6QBi7jD1r335yazQAL6asJsDAJHZBXHjMQXwwaJ3kWbHvGZSsxJS63ayqRzz/7
 ivzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S0Ueggh+wm/GPd/Mj39vTrcgI17x0hRoe27k1LRVPFU=;
 b=T3GHuF+jTL2zvrSPoXvMHuU0q51zjK/0vcDEylwwwhKnuqjECPNtjS2cH/Slgtj/0B
 Bs74f+ACq0fuLdrQ/lCx3r/uKGpfeZ3IHdgpnP33/Vom9KvP7hBqPlMLitQ2LYsEm6OX
 eBMGIq02GJnbPwdGmk+8xSeNFDlT+reKc/+ZrnepoBbkqgUnT/Jq5YkUDSk3vnjXvWvz
 ReuAd728Kcde/Fz0mAB43nQJrg4juACYsq++PE2QpXkcEv/iTzk1QCVnhrAAaSmecqgd
 WxFVu5HPSwiTqmtBXbTCvrY3GQuzJuAmvaprjnb2R2B047gTvUxp41YsHPj8JeUh8z0r
 4nhg==
X-Gm-Message-State: AJcUukcE5tYhmDZRdOxKv30aZT4EHR81/uPH7tAYRr21DM6F4fEdtdv1
 uUpob986X7UmSDzpNwybdYzPIan2
X-Google-Smtp-Source: ALg8bN6gDrThLvZCLAYXSKRt2dUdCGwVW+9268Uy2LiBMc+EayU7oM25YSrkJVpOXah6eDz8DrC3jQ==
X-Received: by 2002:a9d:4b0f:: with SMTP id q15mr31131162otf.201.1549063259307; 
 Fri, 01 Feb 2019 15:20:59 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id f127sm4112691oia.19.2019.02.01.15.20.58
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Feb 2019 15:20:58 -0800 (PST)
Subject: Re: SNMP query
To: openbmc@lists.ozlabs.org
References: <CANT4NrJLCLwH6dW9iTD8yMUjdbw-7-ai6YEfw97s0D-sr33Vww@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <af97d396-5534-6c48-e656-e0e8141869e8@gmail.com>
Date: Fri, 1 Feb 2019 17:20:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CANT4NrJLCLwH6dW9iTD8yMUjdbw-7-ai6YEfw97s0D-sr33Vww@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Feb 2019 23:21:03 -0000

On 1/29/19 11:31 AM, susan jasinski wrote:
> On the GUI SNMP panel, all customers that we tested told us that they 
> want the ability to test the manager host name or IP address that they 
> provide to be sure that it is accurate. Right now, the BMC does not have 
> this ability.
> 
> My team did some digging around on the internet and found this SNMP 
> query suggestion. 
> https://support.panorama9.com/hc/en-us/articles/203568188-Test-if-SNMP-devices-are-responding-correctly-to-SNMP-queries
> 

This won't work. We don't support snmp standard objects (no agent). We 
are only sending traps with log message payloads.

Kurt Taylor (krtaylor)
