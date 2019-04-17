Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RsS8F7TZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kstC1t3rzDqKv
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 05:36:19 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 8so12569248pfr.4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9Xv2AiLBxP230NxpULtJp+e6BKtInrvQjlgICyg83+g=;
 b=RsS8F7TZMNCGNmZqltNN/pQwVSWUYZjDL3Ej0UML50GFbAt0eeKN8ETLg3NZuTOTAx
 FguVRwJdeL0e5ff7+PsKMkWjYmxLwbbe3wAuBF1+pN4ckGNltMwaVWTgc34DUmYBzDu/
 xFWKJe20R1VbLtdI8XDgGuEVQnI5pmvqui7+ZgVd28XBShfNJT/wpy2k02tO4tKBor3O
 nb86/8PWTeckiQvZAswh2MXWNeyf+9dihkoDutm1n/pON5k89haHcwR2PWmZOxxixJl4
 DGAvnnxx4FHxSO2JfumF0mhc1YZ+GDqrCA0Jn3IwBseXTDrHYKrTUXr20jb/cw8a3LfI
 CARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9Xv2AiLBxP230NxpULtJp+e6BKtInrvQjlgICyg83+g=;
 b=J1+nRCGSo11g2eC4UuA8tCxr9um3ikn5OLsMLnJ1wn9zUBDqcKnHuArFTLc2zdoo6o
 HZwgrVKJ9+uIT4I77CEUV0OxfYa+VOxoLr2tx3J9pa7r5nM0P+UBSM63+xxWYBCfljPi
 3leZuWMmsbjy7aKvTijZ438GxBKinYfPsN7rvoyqrcht1eFsHi4fa0KqXYsLQB9iX8QF
 s/DiCjYCizUV0vNgSh52Xt6NxInPVmjZ0UMSmwKUN14eNq2saLCOB2UWFjdgc6mZNXXW
 YbTjkFPv1s++iR58LN9O07D/44Qud+zZz0ZKPGJk9E1up2/Z4tYMPNn2rFT/+o3IWYto
 9zdA==
X-Gm-Message-State: APjAAAWelq+pKFGFpon0LySOLLbCXi/Bfb+Rg+rQEBdWjYbwebiVdxMW
 QdlbjdBJG/7pdjAQEn7sUoo=
X-Google-Smtp-Source: APXvYqxmUfDr1+XvAo4GxGZO3KmrGyKEyt1gPl74YFKvFj4iRjawWXEAz+iThNskLWxBI+V9A6UeXw==
X-Received: by 2002:a65:5c8c:: with SMTP id a12mr84639573pgt.296.1555529775726; 
 Wed, 17 Apr 2019 12:36:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b1sm29118622pgq.15.2019.04.17.12.36.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 12:36:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Apr 2019 12:36:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Cc: Alexander Amelkin <a.amelkin@yadro.com>, linux-hwmon@vger.kernel.org,
 "Edward A . James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org,
 Alexander Soldatov <a.soldatov@yadro.com>
Subject: Re: [PATCH v2 1/1] hwmon (occ): Add temp sensor value check
Message-ID: <20190417193614.GB23825@roeck-us.net>
References: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
 <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
 <48e874f0-c865-12c7-cf93-5e569c27f877@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e874f0-c865-12c7-cf93-5e569c27f877@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 17 Apr 2019 19:36:19 -0000

On Wed, Apr 17, 2019 at 01:35:41PM -0500, Eddie James wrote:
> 
> On 4/17/19 1:03 PM, Alexander Amelkin wrote:
> >From: Alexander Soldatov <a.soldatov@yadro.com>
> >
> >The occ driver supports two formats for the temp sensor value.
> >
> >The OCC firmware for P8 supports only the first format, for which
> >no range checking or error processing is performed in the driver.
> >Inspecting the OCC sources for P8 reveals that OCC may send
> >a special value 0xFFFF to indicate that a sensor read timeout
> >has occurred, see
> >
> >https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395
> >
> >That situation wasn't handled in the driver. This patch adds invalid
> >temp value check for the sensor data format 1 and handles it the same
> >way as it is done for the format 2, where EREMOTEIO is reported for
> >this case.
> 
> 
> Thanks Alexander and Guenter.
> 
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 

Applied.

Thanks,
Guenter

> 
> >
> >Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> >Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> >Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
> >Cc: Edward A. James <eajames@us.ibm.com>
> >Cc: Joel Stanley <joel@jms.id.au>
> >---
> >  drivers/hwmon/occ/common.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> >diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> >index 4679acb..825631c 100644
> >--- a/drivers/hwmon/occ/common.c
> >+++ b/drivers/hwmon/occ/common.c
> >@@ -235,6 +235,12 @@ static ssize_t occ_show_temp_1(struct device *dev,
> >  		val = get_unaligned_be16(&temp->sensor_id);
> >  		break;
> >  	case 1:
> >+		/*
> >+		 * If a sensor reading has expired and couldn't be refreshed,
> >+		 * OCC returns 0xFFFF for that sensor.
> >+		 */
> >+		if (temp->value == 0xFFFF)
> >+			return -EREMOTEIO;
> >  		val = get_unaligned_be16(&temp->value) * 1000;
> >  		break;
> >  	default:
> 
