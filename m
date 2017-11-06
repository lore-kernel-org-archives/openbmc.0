Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=74.125.82.194; helo=mail-ot0-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
 [74.125.82.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yW5rb2ZTBzDr4J
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 08:52:30 +1100 (AEDT)
Received: by mail-ot0-f194.google.com with SMTP id w8so3588042otw.11
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 13:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qIBcQNjGRAmfbTFK7Y+sQovjwhUIzdNj7unfaosOr2k=;
 b=ItQZQ+ou7fiurve+jqkb8/tzn4d52uwiU2HvBy9prCH2hZcuUCjD/7UlQlysjZhzOA
 +OcSoxTtThoBfTOkHBvlvWTbvnFDXXigmOBjSk1q96e8TnLyV2Ztnyq6n0Leq9t8kR7f
 9SpLLsjC7Xlgiq/PeGQ7QDNwkg6OmdCR6KeEDPVuYa3bcB2TaEydTwGkR37vXYnKYCCP
 LIpUUik7RRojsqY45J5KnXUnX1YYqfT7/ysB3pOvny0YibYXIBdqg3Dj6v9VTZLGSdTB
 +04j1yCeeEZLuR3zcwe4c1RMgImNixBi23mGC0PRnWErq/CjETHUXX7T3g77ZrUX7vhN
 9Iyg==
X-Gm-Message-State: AJaThX60lu9PyJ9Pm2i54g3QSme0HGz0ui4DkeNcUWfy+LTML1Rbr8q5
 688aiAD3FMjSa6+DKayijA==
X-Google-Smtp-Source: ABhQp+R6NCRwXCgBGjx3UXUC+kmuK7HYEQC6fO8mFecWewFS0aMRqluelvqCcJp4ShCKM1sKzPKQBw==
X-Received: by 10.157.45.202 with SMTP id g68mr9703621otb.318.1510005148936;
 Mon, 06 Nov 2017 13:52:28 -0800 (PST)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id h7sm6331224oti.76.2017.11.06.13.52.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Nov 2017 13:52:28 -0800 (PST)
Date: Mon, 6 Nov 2017 15:52:27 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com,
 jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 1/6] dt-bindings: pmbus: Add Maxim MAX31785
 documentation
Message-ID: <20171106215227.kbtyhpfbzffddp7n@rob-hp-laptop>
References: <20171103045306.26448-1-andrew@aj.id.au>
 <20171103045306.26448-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170609 (1.8.3)
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
X-List-Received-Date: Mon, 06 Nov 2017 21:52:31 -0000

On Fri, Nov 03, 2017 at 03:53:01PM +1100, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../devicetree/bindings/hwmon/max31785.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt

Acked-by: Rob Herring <robh@kernel.org>
