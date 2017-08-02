Return-Path: <bjwyman@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN6qH4pgwzDrG2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 08:11:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k68bP2+Z"; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id a77so5937445qkb.2
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 15:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=g5sZIJ93W9N0CbPgc2u+azlK2Tn5S2+bhNfzgEJdA0A=;
 b=k68bP2+ZcZ72TEx1tO5Zj9kzPfdSnz3NXcPgcwVtWswWJJy2wchrsm/sz0g1cuwyzH
 K+Ga35a+e5q7I327A/Dw/wGb7bP8MRW3dCfCjFMTmOgxzJc3XI56OHhmqC51AxLiXYx5
 AjqlhPIEj7LPj4hfQc7EoBWPbWVB3uJe16W8sj1SHwsc1LQMN8trklY8HSEe3caEQjt1
 S53TLQL4NqbjsnzvOoLLdCIZqjdtoJAb50Rpl0gJf/ii+scvDegxFYjRJHS0LNfTV/xA
 mfw4NClsQ/RKeyubgqVVHuaeTKan48dlTILwGc2Zt0p+k5qX9K5Xd0WIYL9yqMyRiZLj
 YX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=g5sZIJ93W9N0CbPgc2u+azlK2Tn5S2+bhNfzgEJdA0A=;
 b=QB/Yjg1Du0C7Z+z0YEAV8ecAa64fjxCQjsm0qN8nLOEp/gsBdnADAeqNF/armhDkVX
 oagm+SK0F+31iIos8MY2/n9TxK4Ua0i77VIflGo+nwKtQo4xCk0zcyX24n2AVgQ9MoV9
 Jy5BWDgGqZ2N++ELLYfy+UfvOvoGUgWn8VuwotgrNuqnt1eXbuNpKGBOLYeW0Y+DSYRt
 IBeQi6qBMwzeOnoqk/c0iZaR2oLWPFOqRKMouzo6WvQ01dtmpwWT+aUevh5zvagDMwFs
 MqbVMADobwUJeTTzaQsGTJoXz9nCNQd7L4h0nXjd9QuXqCbpwzbAmJMOhsXpnBG8mKzy
 +Ztw==
X-Gm-Message-State: AIVw113a0dlEGLLgGhXPS6sKgh7kYgvufUPKNUGU1LOyExc14YvH7+zJ
 czdE8fmM54lY2X2QATgtJDXJdBOnhQ==
X-Received: by 10.55.160.135 with SMTP id j129mr30912652qke.341.1501711913024; 
 Wed, 02 Aug 2017 15:11:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Wed, 2 Aug 2017 15:11:52 -0700 (PDT)
In-Reply-To: <1501705534-27606-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Wed, 2 Aug 2017 17:11:52 -0500
Message-ID: <CAK_vbW1GJAaV9OLWTcyY=2s55zMELs1qZ59PZZc-6H1mcm=gEg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3 3/5] Documentation: hwmon: Add IBM power
 supply documentation
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 02 Aug 2017 22:11:57 -0000

On Wed, Aug 2, 2017 at 3:25 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  Documentation/hwmon/ibmps | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/hwmon/ibmps
>
> diff --git a/Documentation/hwmon/ibmps b/Documentation/hwmon/ibmps
> new file mode 100644
> index 0000000..7f13fd4
> --- /dev/null
> +++ b/Documentation/hwmon/ibmps
> @@ -0,0 +1,53 @@
> +Kernel driver ibmps
> +====================
> +
> +Supported chips:
> +  * IBM Witherspoon power supply
> +
> +Author: Eddie James <eajames@us.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver supports the IBM power supply. This driver is a client to the core
> +PMBus driver.
> +
> +Usage Notes
> +-----------
> +
> +This driver should auto-detect devices. In the event that it does not, you will
> +have to instantiate the devices explicitly. Please see
> +Documentation/i2c/instantiating-devices for details.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported:
> +
> +curr1_alarm            Output current over-current fault.
> +curr1_input            Measured output current in mA.
> +curr1_label            "iout1"
> +
> +fan1_alarm             Fan 1 warning.
> +fan1_fault             Fan 1 fault.
> +fan1_input             Fan 1 speed in RPM.
> +fan2_alarm             Fan 2 warning.
> +fan2_fault             Fan 2 fault.
> +fan2_input             Fan 2 speed in RPM.
> +
> +in1_alarm              Input voltage under-voltage fault.

Is this the normal/regular file to put this under-voltage fault in? I
noticed that the UCD9200 device driver appears to be the only one
looking for that right now, and it has it updating in1_lcrit_alarm:
ucd9200:in1_lcrit_alarm         Voltage critical low alarm. From
VIN_UV_FAULT status.

> +in1_input              Measured input voltage in mV.
> +in1_label              "vin"
> +in2_alarm              Output voltage over-voltage fault.
> +in2_input              Measured output voltage in mV.
> +in2_label              "vout1"
> +
> +power1_input           Measured input power in uW.
> +power1_label           "pin"
> +
> +temp1_alarm            PSU inlet ambient temperature over-temperature fault.
> +temp1_input            Measured PSU inlet ambient temp in millidegrees C.
> +temp2_alarm            Secondary rectifier temp over-temperature fault.
> +temp2_input            Measured secondary rectifier temp in millidegrees C.
> +temp3_alarm            ORing FET temperature over-temperature fault.
> +temp3_input            Measured ORing FET temperature in millidegrees C.
> --
> 1.8.3.1
>
