Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lpUC0dUc"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWBcM4D22zDrK6
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 12:27:14 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id j3so9716348pga.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 17:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qT/qkVfjAtYDdhKVqJ6cgkXaFtNrKTQXiDIP07gGlkg=;
 b=lpUC0dUcDbZM4y8UXJAfisZ6knQQ7gsohWPuy0TtCpwlgzcp2ETFpyBpPDwi905HTF
 c3/sP7uErfYQKMX6kVEhyNLDfqec9BpGp2Kh+/xZCDe6m8Hi4J/oaDSMrlSm774z8OC4
 h7yg14SD1JnIVIB9+vjbuS3J3O7mw54KIg5g+UrYRS+yKndjSn6yi1+w1cbX585xd/KQ
 FHviRVa/LZ+70KSqJUSx1858s91QQ3lD53HZcaO37QbZ5Onc4QQi1TDmYXDluwkCIz2g
 V0yvWbCdK9+ud3Jg4PHbZXmLY/JdaIfKT6tLmWj0Y3Gn03IgG6a32/CIzvqPIIlqfX+U
 nZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qT/qkVfjAtYDdhKVqJ6cgkXaFtNrKTQXiDIP07gGlkg=;
 b=ShTAFYKQSN8gJR1+yDbWPL0TeL3O08d/C9mrQ7G6keraYvYw50dfHQkXFkcF9Ts1d5
 buS3ZoChRKTJzLWGbnTYJhBPeMmloXD3SH+pZtRdhNMoyb8E0juNj0tJlnAFg36ft71l
 W8cBwOX+lNh2ehDoMIPo32ujndNsuYHDWxefrFdW7G7GLRr6PG/nlh7Jd0io2hB+YSRc
 bubz3uf5Ui25HxS09CfjI1u8PVMXDWIxlkXz65yq+lSIINealfkYRk1IhGBLsM0IClV5
 T3HnHoA/yUExosah+u8vWo4/38+Va5JP+fL6tBINg8imbDjuwiYcICjs7En8/XFTLhit
 GTgw==
X-Gm-Message-State: AMCzsaWUAuj860QNuLFe/Pz2ZOfw9q+A6kQVNsbCQY7GXOusifQFIGbT
 AIqifEDwjvybDI0IBgGUlU4=
X-Google-Smtp-Source: ABhQp+Tsvia8ITr1Njxc05Ci6bG8jeHDbWQQZ/vpbHzQprxz6b8IqhNeZFrrxILLwBmoMthKbq/2NA==
X-Received: by 10.159.197.1 with SMTP id bj1mr16231767plb.219.1510018033285;
 Mon, 06 Nov 2017 17:27:13 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id s4sm62474pgp.40.2017.11.06.17.27.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Nov 2017 17:27:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Nov 2017 17:27:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4,1/6] dt-bindings: pmbus: Add Maxim MAX31785 documentation
Message-ID: <20171107012711.GA13616@roeck-us.net>
References: <20171103045306.26448-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-2-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 01:27:16 -0000

On Fri, Nov 03, 2017 at 03:53:01PM +1100, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/max31785.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
> new file mode 100644
> index 000000000000..106e08c56aaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max31785.txt
> @@ -0,0 +1,22 @@
> +Bindings for the Maxim MAX31785 Intelligent Fan Controller
> +==========================================================
> +
> +Reference:
> +
> +https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> +
> +The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
> +management with temperature and remote voltage sensing. Various fan control
> +features are provided, including PWM frequency control, temperature hysteresis,
> +dual tachometer measurements, and fan health monitoring.
> +
> +Required properties:
> +- compatible     : One of "maxim,max31785" or "maxim,max31785a"
> +- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
> +
> +Example:
> +
> +        fans@52 {
> +                compatible = "maxim,max31785";
> +                reg = <0x52>;
> +        };
