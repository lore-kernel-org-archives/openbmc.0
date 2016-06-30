Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg8mj56hTzDqlN
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 16:30:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ySlltBwG; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id t190so6516684pfb.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 23:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1EYEa0+Fwzr6fgAd0nq2isQrav7/ywC25sjX7eeTr8=;
 b=ySlltBwGIlaTfDqt4cPQZtS8imqhYXNG/5uPfb5YfKsMO4F1Jut3a0/Vcc8FSK90BV
 mlXNLVLhbmgjAfsMxo5dSYmzNGyUE04VRnFCUBTZ9bSPNGoRxrZIsuuv5UTv2mc/1rwC
 ODEtuLxpwn5+Bj4KErv2L7RSZVsFT5XAmd0bZsGctZv/Fs48T1R2myZLkLCgYNvzkqGA
 e1fjJQcuUSK7HmbWHu6Vr2TE3IwYidUGR8rEI1cWLPSSuNoS1wcX/DnEQshxXjc9Bh1j
 rw0IMT+g9h5499QVsxf6uIBoLmSQLbomoB1Twh0IevYMpzVPnzwyhQ7+Sqp64F+Ocvgc
 HcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O1EYEa0+Fwzr6fgAd0nq2isQrav7/ywC25sjX7eeTr8=;
 b=JU5K8IvnAIIjkkRHWPMA1Iqk8QwoWkregYSjV8Wxrcfcwr5JlHegZDYgz1UNkxGkZZ
 OGTMAwnLDQLUobYC7WjbYM7cyADffFlScJB8RPMROX3LzUcNBZuUfMH5PiQC/JwIQyjv
 Q7hX34QMLw54SxUhDDK+eoA7SloK5MVMBlwzoFzb63HtpfKxW8Si1XEeHv8gC4zWXTCF
 RJbE7OvX9hDjAxzq3rG9jSmBxrdVQ92AwKbj/hAPW/lxSHi7Vg4qdLFDesqSP8zGks1L
 jIsoY1FmhWDd92+PtJCSN33n3wkE4jFd3TyIwFVxYc4Zn0AFT36pDUssMQVNmfpoPX2q
 ASxg==
X-Gm-Message-State: ALyK8tJWiVX5YbIEKNmXpfCVD+R9QtkZybNKTRFEBiX0i/gicv0TLlDHMj/fBZVUIZBBEA==
X-Received: by 10.98.92.65 with SMTP id q62mr17312058pfb.26.1467268225596;
 Wed, 29 Jun 2016 23:30:25 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id p129sm2444316pfb.73.2016.06.29.23.30.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jun 2016 23:30:24 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1467268194.6386.29.camel@jms.id.au>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 9/9] ast-g4/g5: large cleanup
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 30 Jun 2016 15:59:54 +0930
In-Reply-To: <1467216591-8616-10-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-10-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 06:30:31 -0000

On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
> This is 99% code alignment cleanups, some removal of code not related
> to the G4 of G5 and some very light rewrite.
> 
> Tested on palmetto and a ast2500 evb.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

I started reading from the bottom and about 45 minutes in I gave up
taking a close look.

I found a few small issues to fix. Ignore any whitespace/deletion fixes
for now; they can come later. But we should fix the tiny little bugs
that have crept in.

> @@ -1133,11 +1064,12 @@ ast_scu_show_system_info (void)
>  
>  	h_pll = ast_get_h_pll_clk();
>  
> -	//AST2500 A1 fix
> +	/* AST2500 A1 fix */
>  	axi_div = 2;
> -	ahb_div =
> (SCU_HW_STRAP_GET_AXI_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1)) +
> 1);
> +	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(
> +			   ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
>  
> -	SCUMSG("CPU = %d MHz , AXI = %d MHz, AHB = %d MHz (%d:%d:1)
> \n",
> +	printf("CPU = %d MHz , AXI = %d MHz, AHB = %d MHz (%d:%d:1)
> \n",
>  			h_pll/1000000,
>  			h_pll/axi_div/1000000,
>  			h_pll/axi_div/ahb_div/1000000, axi_div,
> ahb_div);
> @@ -1149,381 +1081,345 @@ ast_scu_show_system_info (void)
>  
>  	div =
> SCU_HW_STRAP_GET_CPU_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1));
>  	div += 1;
> -	SCUMSG("CPU = %d MHz ,AHB = %d MHz (%d:1) \n",
> h_pll/1000000, h_pll/div/1000000,div);
> +
> +	printf("CPU = %d MHz ,AHB = %d MHz (%d:1) \n",
> h_pll/1000000,
> +	       h_pll/div / 1000000, div);
>  #endif
>  	return ;
>  }
>  
>  
> -//*********************************** Multi-function pin control
> ***********************************
> -extern void
> -ast_scu_multi_func_uart(u8 uart)
> +/*********************** Multi-function pin control
> ***************************/

Drop the ascii art.

> +void ast_scu_multi_func_uart(u8 uart)
>  {
>  	switch(uart) {
> -		case 1:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL2) |
> -						SCU_FUN_PIN_UART1_RX
> D |
> -						SCU_FUN_PIN_UART1_TX
> D |
> -						SCU_FUN_PIN_UART1_NR
> TS |
> -						SCU_FUN_PIN_UART1_ND
> TR |
> -						SCU_FUN_PIN_UART1_NR
> I |
> -						SCU_FUN_PIN_UART1_ND
> SR |
> -						SCU_FUN_PIN_UART1_ND
> CD |
> -						SCU_FUN_PIN_UART1_NC
> TS,
> -				AST_SCU_FUN_PIN_CTRL2);
> -			break;
> -		case 2:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL2) |
> -						SCU_FUN_PIN_UART2_RX
> D |
> -						SCU_FUN_PIN_UART2_TX
> D |
> -						SCU_FUN_PIN_UART2_NR
> TS |
> -						SCU_FUN_PIN_UART2_ND
> TR |
> -						SCU_FUN_PIN_UART2_NR
> I |
> -						SCU_FUN_PIN_UART2_ND
> SR |
> -						SCU_FUN_PIN_UART2_ND
> CD |
> -						SCU_FUN_PIN_UART2_NC
> TS,
> -				AST_SCU_FUN_PIN_CTRL2);
> -			break;
> -		case 3:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) |
> -						SCU_FUN_PIN_UART3_RX
> D |
> -						SCU_FUN_PIN_UART3_TX
> D |
> -						SCU_FUN_PIN_UART3_NR
> TS |
> -						SCU_FUN_PIN_UART3_ND
> TR |
> -						SCU_FUN_PIN_UART3_NR
> I |
> -						SCU_FUN_PIN_UART3_ND
> SR |
> -						SCU_FUN_PIN_UART3_ND
> CD |
> -						SCU_FUN_PIN_UART3_NC
> TS,
> -				AST_SCU_FUN_PIN_CTRL1);
> -			break;
> -		case 4:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) |
> -						SCU_FUN_PIN_UART4_RX
> D |
> -						SCU_FUN_PIN_UART4_TX
> D |
> -						SCU_FUN_PIN_UART4_NR
> TS |
> -						SCU_FUN_PIN_UART4_ND
> TR |
> -						SCU_FUN_PIN_UART4_NR
> I |
> -						SCU_FUN_PIN_UART4_ND
> SR |
> -						SCU_FUN_PIN_UART4_ND
> CD |
> -						SCU_FUN_PIN_UART4_NC
> TS,
> -				AST_SCU_FUN_PIN_CTRL1);
> -			break;
> -		case 6:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL5) |
> -						SCU_FUC_PIN_UART6,
> -				AST_SCU_FUN_PIN_CTRL5);
> -			break;
> +	case 1:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
> +			      SCU_FUN_PIN_UART1_RXD |
> +			      SCU_FUN_PIN_UART1_TXD |
> +			      SCU_FUN_PIN_UART1_NRTS |
> +			      SCU_FUN_PIN_UART1_NDTR |
> +			      SCU_FUN_PIN_UART1_NRI |
> +			      SCU_FUN_PIN_UART1_NDSR |
> +			      SCU_FUN_PIN_UART1_NDCD |
> +			      SCU_FUN_PIN_UART1_NCTS,
> +			      AST_SCU_FUN_PIN_CTRL2);
> +		break;
> +	case 2:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
> +			      SCU_FUN_PIN_UART2_RXD |
> +			      SCU_FUN_PIN_UART2_TXD |
> +			      SCU_FUN_PIN_UART2_NRTS |
> +			      SCU_FUN_PIN_UART2_NDTR |
> +			      SCU_FUN_PIN_UART2_NRI |
> +			      SCU_FUN_PIN_UART2_NDSR |
> +			      SCU_FUN_PIN_UART2_NDCD |
> +			      SCU_FUN_PIN_UART2_NCTS,
> +			      AST_SCU_FUN_PIN_CTRL2);
> +		break;
> +	case 3:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
> +			      SCU_FUN_PIN_UART3_RXD |
> +			      SCU_FUN_PIN_UART3_TXD |
> +			      SCU_FUN_PIN_UART3_NRTS |
> +			      SCU_FUN_PIN_UART3_NDTR |
> +			      SCU_FUN_PIN_UART3_NRI |
> +			      SCU_FUN_PIN_UART3_NDSR |
> +			      SCU_FUN_PIN_UART3_NDCD |
> +			      SCU_FUN_PIN_UART3_NCTS,
> +			      AST_SCU_FUN_PIN_CTRL1);
> +		break;
> +	case 4:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
> +			      SCU_FUN_PIN_UART4_RXD |
> +			      SCU_FUN_PIN_UART4_TXD |
> +			      SCU_FUN_PIN_UART4_NRTS |
> +			      SCU_FUN_PIN_UART4_NDTR |
> +			      SCU_FUN_PIN_UART4_NRI |
> +			      SCU_FUN_PIN_UART4_NDSR |
> +			      SCU_FUN_PIN_UART4_NDCD |
> +			      SCU_FUN_PIN_UART4_NCTS,
> +			      AST_SCU_FUN_PIN_CTRL1);
> +		break;
> +	case 6:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_UART6,
> +			      AST_SCU_FUN_PIN_CTRL5);
> +		break;
>  #ifdef AST_SOC_G5
> -		case 7:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART7,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> -		case 8:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART8,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> -		case 9:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART9,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> -		case 10:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL2) &
> -						~(SCU_FUN_PIN_VGAVS
> | SCU_FUN_PIN_VGAHS),
> -				AST_SCU_FUN_PIN_CTRL2);
> -
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART10,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> -		case 11:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL2) &
> -						~(SCU_FUN_PIN_DDCDAT
> | SCU_FUN_PIN_DDCCLK),
> -				AST_SCU_FUN_PIN_CTRL2);
> -
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART11,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> -		case 12:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART12,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> -		case 13:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL6) |
> -						SCU_FUN_PIN_UART13,
> -				AST_SCU_FUN_PIN_CTRL6);
> -			break;
> +	case 7:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART7,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
> +	case 8:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART8,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
> +	case 9:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART9,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
> +	case 10:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
> +			      ~(SCU_FUN_PIN_VGAVS |
> SCU_FUN_PIN_VGAHS),
> +			      AST_SCU_FUN_PIN_CTRL2);
> +
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART10,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
> +	case 11:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
> +			      ~(SCU_FUN_PIN_DDCDAT |
> SCU_FUN_PIN_DDCCLK),
> +			      AST_SCU_FUN_PIN_CTRL2);
> +
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART11,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
> +	case 12:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART12,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
> +	case 13:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
> +			      SCU_FUN_PIN_UART13,
> +			      AST_SCU_FUN_PIN_CTRL6);
> +		break;
>  #endif
>  	}
>  
>  
>  }
>  
> -extern void
> -ast_scu_multi_func_video()
> +void ast_scu_multi_func_video()
>  {
> -#if defined(CONFIG_ARCH_2100) || defined(CONFIG_ARCH_2200)
> -	ast_scu_write(ast_scu_read(AST_SCU_MULTI_FUNC_2) |
> -				MULTI_FUNC_VIDEO_RGB18 |
> -				MULTI_FUNC_VIDEO_SINGLE_EDGE,
> -		AST_SCU_MULTI_FUNC_2);
> -#elif defined(CONFIG_ARCH_1100) || defined(CONFIG_ARCH_2050)
> -	ast_scu_write(ast_scu_read(AST_SCU_MULTI_FUNC_2) |
> -				MULTI_FUNC_VIDEO_RGB18 |
> -				MULTI_FUNC_VIDEO_SINGLE_EDGE,
> -		AST_SCU_MULTI_FUNC_2);
> -#else
>  
> -#endif
>  }
>  
> -#ifdef CONFIG_ARCH_AST1010
> -extern void
> -ast_scu_multi_func_eth(u8 num)
> +void ast_scu_multi_func_eth(u8 num)
>  {
>  	switch(num) {
> -		case 0:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL3) |
> -						SCU_FUN_PIN_MAC0_MDI
> O |
> -						SCU_FUN_PIN_MAC0_MDC
> |
> -						0xff000000,
> -				AST_SCU_FUN_PIN_CTRL3);
> -
> -			/* Currently we use fix value in MAC timing
> on EVB */
> -			ast_scu_write(0x2255, AST_SCU_MAC_CLK);
> -
> -			break;
> -		case 1:
> +	case 0:
> +		if(ast_scu_read(AST_SCU_HW_STRAP1) &
> SCU_HW_STRAP_MAC0_RGMII) {
> +			printf("MAC0 : RGMII \n");
>  			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) |
> -						SCU_FUN_PIN_MAC1_PHY
> _LINK,
> -				AST_SCU_FUN_PIN_CTRL1);
> -
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL5) |
> -						SCU_FUC_PIN_MAC1_MDI
> O,
> -				AST_SCU_FUN_PIN_CTRL5);
> -
> -			break;
> -	}
> -}
> -#else
> -extern void
> -ast_scu_multi_func_eth(u8 num)
> -{
> -	switch(num) {
> -		case 0:
> -			if(ast_scu_read(AST_SCU_HW_STRAP1) &
> SCU_HW_STRAP_MAC0_RGMII) {
> -				SCUMSG("MAC0 : RGMII \n");
> -				ast_scu_write(ast_scu_read(AST_SCU_F
> UN_PIN_CTRL1) |
> -							SCU_FUN_PIN_
> MAC0_PHY_LINK,
> -					AST_SCU_FUN_PIN_CTRL1);
> -			} else {
> -				SCUMSG("MAC0 : RMII/NCSI \n");
> -				ast_scu_write(ast_scu_read(AST_SCU_F
> UN_PIN_CTRL1) &
> -							~SCU_FUN_PIN
> _MAC0_PHY_LINK,
> -					AST_SCU_FUN_PIN_CTRL1);
> -			}
> +				      SCU_FUN_PIN_MAC0_PHY_LINK,
> +				      AST_SCU_FUN_PIN_CTRL1);
> +		} else {
> +			printf("MAC0 : RMII/NCSI \n");
> +			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) &
> +				      ~SCU_FUN_PIN_MAC0_PHY_LINK,
> +				      AST_SCU_FUN_PIN_CTRL1);
> +		}
>  
>  #ifdef AST_SOC_G5
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) |
> -						SCU_FUN_PIN_MAC0_PHY
> _LINK,
> -				AST_SCU_FUN_PIN_CTRL1);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
> +			      SCU_FUN_PIN_MAC0_PHY_LINK,
> +			      AST_SCU_FUN_PIN_CTRL1);
>  
>  #endif
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL3) |
> -						SCU_FUN_PIN_MAC0_MDI
> O |
> -						SCU_FUN_PIN_MAC0_MDC
> ,
> -				AST_SCU_FUN_PIN_CTRL3);
> -
> -			break;
> -		case 1:
> -			if(ast_scu_read(AST_SCU_HW_STRAP1) &
> SCU_HW_STRAP_MAC1_RGMII) {
> -				SCUMSG("MAC1 : RGMII \n");
> -				ast_scu_write(ast_scu_read(AST_SCU_F
> UN_PIN_CTRL1) |
> -							SCU_FUN_PIN_
> MAC1_PHY_LINK,
> -					AST_SCU_FUN_PIN_CTRL1);
> -			} else {
> -				SCUMSG("MAC1 : RMII/NCSI \n");
> -				ast_scu_write(ast_scu_read(AST_SCU_F
> UN_PIN_CTRL1) &
> -						~SCU_FUN_PIN_MAC1_PH
> Y_LINK,
> -					AST_SCU_FUN_PIN_CTRL1);
> -			}
> -
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
> +			      SCU_FUN_PIN_MAC0_MDIO |
> +			      SCU_FUN_PIN_MAC0_MDC,
> +			      AST_SCU_FUN_PIN_CTRL3);
> +
> +		break;
> +	case 1:
> +		if(ast_scu_read(AST_SCU_HW_STRAP1) &
> SCU_HW_STRAP_MAC1_RGMII) {
> +			printf("MAC1 : RGMII \n");
>  			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) |
> -						SCU_FUN_PIN_MAC1_PHY
> _LINK,
> -				AST_SCU_FUN_PIN_CTRL1);
> +				      SCU_FUN_PIN_MAC1_PHY_LINK,
> +				      AST_SCU_FUN_PIN_CTRL1);
> +		} else {
> +			printf("MAC1 : RMII/NCSI \n");
> +			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL1) &
> +				      ~SCU_FUN_PIN_MAC1_PHY_LINK,
> +				      AST_SCU_FUN_PIN_CTRL1);
> +		}
>  
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL5) |
> -						SCU_FUC_PIN_MAC1_MDI
> O,
> -				AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
> +			      SCU_FUN_PIN_MAC1_PHY_LINK,
> +			      AST_SCU_FUN_PIN_CTRL1);
>  
> -			break;
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_MAC1_MDIO,
> +			      AST_SCU_FUN_PIN_CTRL5);
> +
> +		break;
>  	}
>  }
> -#endif
>  
> -extern void
> -ast_scu_multi_func_nand(void)
> +void ast_scu_multi_func_nand(void)
>  {
> -#ifdef AST_SOC_G5
> -#else
> -	//enable NAND flash multipin FLBUSY and FLWP
> +#ifndef AST_SOC_G5
> +	/* enable NAND flash multipin FLBUSY and FLWP */
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
> -				SCU_FUN_PIN_NAND_FLBUSY |
> SCU_FUN_PIN_NAND_FLWP,
> -		AST_SCU_FUN_PIN_CTRL2);
> +		      SCU_FUN_PIN_NAND_FLBUSY |
> SCU_FUN_PIN_NAND_FLWP,
> +		      AST_SCU_FUN_PIN_CTRL2);
>  #endif
>  
>  }
>  
>  #if 0

Remove the dead code?

> -extern void
> -ast_scu_multi_func_nor(void)
> +void ast_scu_multi_func_nor(void)
>  {
> -	//Address
> -	//ROMA2~17
> +	/* Address */
> +
> +	/* ROMA2~17 */
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL8) |
> -				SCU_FUN_PIN_ROMA2 |
> SCU_FUN_PIN_ROMA3 |
> -				SCU_FUN_PIN_ROMA4 |
> SCU_FUN_PIN_ROMA5 |
> -				SCU_FUN_PIN_ROMA6 |
> SCU_FUN_PIN_ROMA7 |
> -				SCU_FUN_PIN_ROMA8 |
> SCU_FUN_PIN_ROMA9 |
> -				SCU_FUN_PIN_ROMA10 |
> SCU_FUN_PIN_ROMA11 |
> -				SCU_FUN_PIN_ROMA12 |
> SCU_FUN_PIN_ROMA13 |
> -				SCU_FUN_PIN_ROMA14 |
> SCU_FUN_PIN_ROMA15 |
> -				SCU_FUN_PIN_ROMA16 |
> SCU_FUN_PIN_ROMA17,
> -		AST_SCU_FUN_PIN_CTRL8);
> -
> -	//ROMA18~21
> +		      SCU_FUN_PIN_ROMA2 | SCU_FUN_PIN_ROMA3 |
> +		      SCU_FUN_PIN_ROMA4 | SCU_FUN_PIN_ROMA5 |
> +		      SCU_FUN_PIN_ROMA6 | SCU_FUN_PIN_ROMA7 |
> +		      SCU_FUN_PIN_ROMA8 | SCU_FUN_PIN_ROMA9 |
> +		      SCU_FUN_PIN_ROMA10 | SCU_FUN_PIN_ROMA11 |
> +		      SCU_FUN_PIN_ROMA12 | SCU_FUN_PIN_ROMA13 |
> +		      SCU_FUN_PIN_ROMA14 | SCU_FUN_PIN_ROMA15 |
> +		      SCU_FUN_PIN_ROMA16 | SCU_FUN_PIN_ROMA17,
> +		      AST_SCU_FUN_PIN_CTRL8);
> +
> +	/* ROMA18~21 */
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL9) |
> -				SCU_FUN_PIN_ROMA18 |
> SCU_FUN_PIN_ROMA19 |
> -				SCU_FUN_PIN_ROMA20 |
> SCU_FUN_PIN_ROMA21,
> -		AST_SCU_FUN_PIN_CTRL9);
> +		      SCU_FUN_PIN_ROMA18 | SCU_FUN_PIN_ROMA19 |
> +		      SCU_FUN_PIN_ROMA20 | SCU_FUN_PIN_ROMA21,
> +		      AST_SCU_FUN_PIN_CTRL9);
>  
> -	//ROMA22,23
> -	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) |
> SCU_FUN_PIN_ROMA22 | SCU_FUN_PIN_ROMA23,
> -		AST_SCU_FUN_PIN_CTRL4);
> +	/* ROMA22,23 */
> +	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) |
> +		      SCU_FUN_PIN_ROMA22 | SCU_FUN_PIN_ROMA23,
> +		      AST_SCU_FUN_PIN_CTRL4);
>  
> -	//ROMA24,25
> -	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
> SCU_FUN_PIN_ROMA24 | SCU_FUN_PIN_ROMA25,
> -		AST_SCU_FUN_PIN_CTRL3);
> +	/* ROMA24,25 */
> +	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
> +		      SCU_FUN_PIN_ROMA24 | SCU_FUN_PIN_ROMA25,
> +		      AST_SCU_FUN_PIN_CTRL3);
>  
> -	//SCU94 [1] = 0
> +	/* SCU94 [1] = 0 */
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> SCU_VIDEO_OUT_MASK,
> -		AST_SCU_FUN_PIN_CTRL6);
> +		      AST_SCU_FUN_PIN_CTRL6);
> +
>  
> +	/* data */
>  
> -	//data
> -	//ROMD 4~7 //ROMWE#, OE#
> +	/* ROMD 4~7 //ROMWE#, OE# */
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) |
> -			SCU_FUN_PIN_ROMOE | SCU_FUN_PIN_ROMWE |
> -			SCU_FUN_PIN_ROMD4 | SCU_FUN_PIN_ROMD5 |
> -			SCU_FUN_PIN_ROMD6 | SCU_FUN_PIN_ROMD7,
> -			AST_SCU_FUN_PIN_CTRL4);
> +		      SCU_FUN_PIN_ROMOE | SCU_FUN_PIN_ROMWE |
> +		      SCU_FUN_PIN_ROMD4 | SCU_FUN_PIN_ROMD5 |
> +		      SCU_FUN_PIN_ROMD6 | SCU_FUN_PIN_ROMD7,
> +		      AST_SCU_FUN_PIN_CTRL4);
>  
> -	//ROMD 8~15
> +	/* ROMD 8~15 */
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -			SCU_FUC_PIN_ROM_16BIT,
> -		AST_SCU_FUN_PIN_CTRL5);
> +		      SCU_FUC_PIN_ROM_16BIT,
> +		      AST_SCU_FUN_PIN_CTRL5);
>  
>  }
>  #endif
>  
> -extern void
> -ast_scu_multi_func_romcs(u8 num)
> +void ast_scu_multi_func_romcs(u8 num)
>  {
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
> -			SCU_FUN_PIN_ROMCS(num),
> -		AST_SCU_FUN_PIN_CTRL3);
> +		      SCU_FUN_PIN_ROMCS(num),
> +		      AST_SCU_FUN_PIN_CTRL3);
>  }
>  
> -extern void
> -ast_scu_multi_func_i2c(void)
> +void ast_scu_multi_func_i2c(void)
>  {
> -	//TODO check ... //In AST2400 Due to share pin with SD ,
> please not enable I2C 10 ~14
> -	// AST 2400 have 14 , AST 2300 9 ...
> +	/* TODO : In AST2400 Due to share pin with SD , please not
> +	 * enable I2C 10 ~14 AST 2400 have 14 , AST 2300 9 ...
> +	 */
>  #ifdef CONFIG_MMC_AST
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -			SCU_FUC_PIN_I2C3 |
> -			SCU_FUC_PIN_I2C4 |
> -			SCU_FUC_PIN_I2C5 |
> -			SCU_FUC_PIN_I2C6 |
> -			SCU_FUC_PIN_I2C7 |
> -			SCU_FUC_PIN_I2C8 |
> -			SCU_FUC_PIN_I2C9,
> -		AST_SCU_FUN_PIN_CTRL5);
> +		      SCU_FUC_PIN_I2C3 |
> +		      SCU_FUC_PIN_I2C4 |
> +		      SCU_FUC_PIN_I2C5 |
> +		      SCU_FUC_PIN_I2C6 |
> +		      SCU_FUC_PIN_I2C7 |
> +		      SCU_FUC_PIN_I2C8 |
> +		      SCU_FUC_PIN_I2C9,
> +		      AST_SCU_FUN_PIN_CTRL5);
>  #else
>  	ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -			SCU_FUC_PIN_I2C3 |
> -			SCU_FUC_PIN_I2C4 |
> -			SCU_FUC_PIN_I2C5 |
> -			SCU_FUC_PIN_I2C6 |
> -			SCU_FUC_PIN_I2C7 |
> -			SCU_FUC_PIN_I2C8 |
> -			SCU_FUC_PIN_I2C9 |
> -			SCU_FUC_PIN_I2C10 |
> -			SCU_FUC_PIN_I2C11 |
> -			SCU_FUC_PIN_I2C12 |
> -			SCU_FUC_PIN_I2C13 |
> -			SCU_FUC_PIN_I2C14) &
> -			~(SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2),
> -		AST_SCU_FUN_PIN_CTRL5);
> +		       SCU_FUC_PIN_I2C3 |
> +		       SCU_FUC_PIN_I2C4 |
> +		       SCU_FUC_PIN_I2C5 |
> +		       SCU_FUC_PIN_I2C6 |
> +		       SCU_FUC_PIN_I2C7 |
> +		       SCU_FUC_PIN_I2C8 |
> +		       SCU_FUC_PIN_I2C9 |
> +		       SCU_FUC_PIN_I2C10 |
> +		       SCU_FUC_PIN_I2C11 |
> +		       SCU_FUC_PIN_I2C12 |
> +		       SCU_FUC_PIN_I2C13 |
> +		       SCU_FUC_PIN_I2C14) &
> +		      ~(SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2),
> +		      AST_SCU_FUN_PIN_CTRL5);
>  #endif
>  }
>  
>  
> -extern void
> -ast_scu_multi_func_pwm_tacho(void)
> +void ast_scu_multi_func_pwm_tacho(void)
>  {
> -	//TODO check
> +	/* TODO check */
>  	u32 sts = ast_scu_read(AST_SCU_FUN_PIN_CTRL3) &~0xcfffff;
>  	ast_scu_write(sts | 0xc000ff, AST_SCU_FUN_PIN_CTRL3);
>  }
>  
>  
> -//0 : usb 2.0 hub mode, 1:usb 2.0 host2 controller
> -extern void
> -ast_scu_multi_func_usb_port1_mode(u8 mode)
> +/*
> + * 0 : usb 2.0 hub mode
> + * 1:usb 2.0 host2 controller
> + */
> +void ast_scu_multi_func_usb_port1_mode(u8 mode)
>  {
>  	if(mode)
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_USB20_HOST,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_USB20_HOST,
> AST_SCU_FUN_PIN_CTRL5);
>  	else
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> ~SCU_FUC_PIN_USB20_HOST,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> +			      ~SCU_FUC_PIN_USB20_HOST,AST_SCU_FUN_PI
> N_CTRL5);
>  }
>  
>  
> -//0 : 1.1 hid 1, 1.1 host , 2, 2.0 host 3, 2.0 device
> -extern void
> -ast_scu_multi_func_usb_port2_mode(u8 mode)
> +/* 0 : 1.1 hid
> + * 1 : 1.1 host
> + * 2 : 2.0 host
> + * 3 : 2.0 device
> + */
> +void ast_scu_multi_func_usb_port2_mode(u8 mode)
>  {
>  #if defined(AST_SOC_G5)
>  	if(mode == 0)
> -		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> ~SCU_FUN_PIN_USBP1_MASK),
> -					AST_SCU_FUN_PIN_CTRL6);
> +		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> +			       ~SCU_FUN_PIN_USBP1_MASK),
> AST_SCU_FUN_PIN_CTRL6);
>  	else if ((mode == 1) || (mode == 2))
> -		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> ~SCU_FUN_PIN_USBP1_MASK) |
> -					SCU_FUN_PIN_USBP1_MODE(0x2),
> -					AST_SCU_FUN_PIN_CTRL6);
> +		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> +			       ~SCU_FUN_PIN_USBP1_MASK) |
> +			      SCU_FUN_PIN_USBP1_MODE(0x2),
> +			      AST_SCU_FUN_PIN_CTRL6);
>  	else if (mode == 3)
> -		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> ~SCU_FUN_PIN_USBP1_MASK) |
> -					SCU_FUN_PIN_USBP1_MODE(0x1),
> -					AST_SCU_FUN_PIN_CTRL6);
> +		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> +			       ~SCU_FUN_PIN_USBP1_MASK) |
> +			      SCU_FUN_PIN_USBP1_MODE(0x1),
> +			      AST_SCU_FUN_PIN_CTRL6);
>  	else {
>  		printf("nothing\n");
>  	}
>  #else
>  	if(mode == 0)
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> ~SCU_FUC_PIN_USB11_PORT2,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> +			      ~SCU_FUC_PIN_USB11_PORT2,
> +			      AST_SCU_FUN_PIN_CTRL5);
>  	else if (mode == 1)
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_USB11_PORT2,
> -			AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_USB11_PORT2,
> AST_SCU_FUN_PIN_CTRL5);
>  	else if (mode == 2)
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_USB20_HOST,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_USB20_HOST,
> AST_SCU_FUN_PIN_CTRL5);
>  	else {
>  		printf("nothing\n");
>  	}
> @@ -1531,281 +1427,281 @@ ast_scu_multi_func_usb_port2_mode(u8 mode)
>  }
>  
>  
> -//0 : gpioQ6,7 mode , 1: usb1.1 host port 4 mode
> -extern void
> -ast_scu_multi_func_usb_port34_mode(u8 mode)
> +/* 0 : gpioQ6,7 mode
> + * 1 : usb1.1 host port 4 mode
> + */
> +void ast_scu_multi_func_usb_port34_mode(u8 mode)
>  {
>  #if defined(AST_SOC_G5)
>  	if(mode) {
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_USB11_PORT4,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_USB11_PORT4,
> AST_SCU_FUN_PIN_CTRL5);
>  		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
> -					(SCU_FUN_PIN_USBP3_DP
> |SCU_FUN_PIN_USBP3_DN | SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
> -					AST_SCU_FUN_PIN_CTRL3);
> +			      (SCU_FUN_PIN_USBP3_DP
> |SCU_FUN_PIN_USBP3_DN |
> +			       SCU_FUN_PIN_USBP4_DP |
> SCU_FUN_PIN_USBP4_DN),
> +			      AST_SCU_FUN_PIN_CTRL3);
>  	} else {
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> ~SCU_FUC_PIN_USB11_PORT4,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> +			      ~SCU_FUC_PIN_USB11_PORT4,
> AST_SCU_FUN_PIN_CTRL5);
>  		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) &
> -					~(SCU_FUN_PIN_USBP3_DP
> |SCU_FUN_PIN_USBP3_DN | SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
> -					AST_SCU_FUN_PIN_CTRL3);
> +			      ~(SCU_FUN_PIN_USBP3_DP
> |SCU_FUN_PIN_USBP3_DN |
> +				SCU_FUN_PIN_USBP4_DP |
> SCU_FUN_PIN_USBP4_DN),
> +			      AST_SCU_FUN_PIN_CTRL3);
>  	}
>  #else
>  	if(mode) {
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_USB11_PORT4,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_USB11_PORT4,
> AST_SCU_FUN_PIN_CTRL5);
>  	} else {
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> ~SCU_FUC_PIN_USB11_PORT4,
> -					AST_SCU_FUN_PIN_CTRL5);
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
> +			      ~SCU_FUC_PIN_USB11_PORT4,
> AST_SCU_FUN_PIN_CTRL5);
>  	}
>  #endif
>  }
>  
>  
> -//0 : 1: SD1 function
> -extern void
> -ast_scu_multi_func_sdhc_8bit_mode(void)
> +/* 0 : 1: SD1 function
> + */
> +void ast_scu_multi_func_sdhc_8bit_mode(void)
>  {
> -		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD1_8BIT,
> -					AST_SCU_FUN_PIN_CTRL5);
> +	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> SCU_FUC_PIN_SD1 |
> +		      SCU_FUC_PIN_SD1_8BIT, AST_SCU_FUN_PIN_CTRL5);
>  }
>  
>  
> -extern void
> -ast_scu_multi_func_sdhc_slot(u8 slot)
> +void ast_scu_multi_func_sdhc_slot(u8 slot)
>  {
>  	switch(slot) {
> -		case 1:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL5) | SCU_FUC_PIN_SD1,
> -						AST_SCU_FUN_PIN_CTRL
> 5);
> -			break;
> -		case 2:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL5) | SCU_FUC_PIN_SD2,
> -						AST_SCU_FUN_PIN_CTRL
> 5);
> -			break;
> -		case 3:
> -			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_C
> TRL5) | SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2,
> -						AST_SCU_FUN_PIN_CTRL
> 5);
> -			break;
> +	case 1:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_SD1,
> AST_SCU_FUN_PIN_CTRL5);
> +		break;
> +	case 2:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_SD2,
> AST_SCU_FUN_PIN_CTRL5);
> +		break;
> +	case 3:
> +		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> +			      SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2,
> +			      AST_SCU_FUN_PIN_CTRL5);
> +		break;
>  	}
>  }
>  
>  
> -//0: VGA , 1 : CRT, 2 : PASS through Port -A, 3 : PASS through Port
> -B
> -extern void
> -ast_scu_set_crt_source(u8 dac_soource)
> +/* 0 : VGA
> + * 1 : CRT
> + * 2 : PASS through Port -A
> + * 3 : PASS through Port -B
> + */
> +void ast_scu_set_crt_source(u8 dac_soource)
>  {
>  	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) &
> ~SCU_MISC_DAC_MASK) |
> -				SCU_MISC_SET_DAC_SOURCE(dac_soource)
>   , AST_SCU_MISC1_CTRL);
> +	      SCU_MISC_SET_DAC_SOURCE(dac_soource)  ,
> AST_SCU_MISC1_CTRL);
>  
>  }
>  
> -
> -extern void
> -ast_scu_multi_func_crt(void)
> +void ast_scu_multi_func_crt(void)
>  {
> -	/* multi-pin for DVO enable DVO (bit18) is VGA , enable DAC
> (bit16) is CRT  */
> +	/* multi-pin for DVO enable DVO (bit18) is VGA , enable DAC
> +	 * (bit16) is CRT
> +	 */
>  #if defined(CONFIG_AST_DAC) || defined(CONFIG_AST_DVO)
> -		ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) &
> ~SCU_MISC_DAC_MASK)
> -					| SCU_MISC_DAC_SOURCE_CRT |
> SCU_MISC_DVO_SOURCE_CRT | SCU_MISC_2D_CRT_EN , AST_SCU_MISC1_CTRL);
> +	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) &
> ~SCU_MISC_DAC_MASK) |
> +		      SCU_MISC_DAC_SOURCE_CRT |
> SCU_MISC_DVO_SOURCE_CRT |
> +		      SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
>  #elif defined(CONFIG_AST_DVO)
> -		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) |
> SCU_MISC_DVO_SOURCE_CRT| SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
> -#else //default(CONFIG_AST_DAC)
> -		ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) &
> ~SCU_MISC_DAC_MASK)
> -					| SCU_MISC_DAC_SOURCE_CRT |
> SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
> +	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) |
> +		      SCU_MISC_DVO_SOURCE_CRT| SCU_MISC_2D_CRT_EN,
> +		      AST_SCU_MISC1_CTRL);
> +#else /* default(CONFIG_AST_DAC) */
> +	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) &
> ~SCU_MISC_DAC_MASK)
> +		      | SCU_MISC_DAC_SOURCE_CRT |
> SCU_MISC_2D_CRT_EN,
> +		      AST_SCU_MISC1_CTRL);
>  #endif
>  
> -	//Digital vodeo input function pins : 00 disable, 10 24bits
> mode 888,
> +	/* Digital vodeo input function pins :
> +	 *     00 disable
> +	 *     10 24bits mode 888
> +	 */
>  	ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
> -			~SCU_FUC_PIN_DIGI_V_OUT_MASK) |
> -			SCU_FUC_PIN_DIGI_V_OUT(VIDEO_24BITS),
> AST_SCU_FUN_PIN_CTRL6);
> +		       ~SCU_FUC_PIN_DIGI_V_OUT_MASK) |
> +		      SCU_FUC_PIN_DIGI_V_OUT(VIDEO_24BITS),
> +		      AST_SCU_FUN_PIN_CTRL6);
>  
> -	//VPI input
> +	/* VPI input */
>  #if 0

Delete this dead code below?

>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
> -			SCU_FUN_PIN_VPIB9 | SCU_FUN_PIN_VPIB8 |
> -			SCU_FUN_PIN_VPIB7 | SCU_FUN_PIN_VPIB6 |
> -			SCU_FUN_PIN_VPIB5 | SCU_FUN_PIN_VPIB4 |
> -			SCU_FUN_PIN_VPIB3 | SCU_FUN_PIN_VPIB2 |
> -			SCU_FUN_PIN_VPIB1 | SCU_FUN_PIN_VPIB0 |
> -			SCU_FUN_PIN_VPICLK | SCU_FUN_PIN_VPIVS |
> -			SCU_FUN_PIN_VPIHS | SCU_FUN_PIN_VPIODD |
> -			SCU_FUN_PIN_VPIDE ,AST_SCU_FUN_PIN_CTRL2);
> +		      SCU_FUN_PIN_VPIB9 | SCU_FUN_PIN_VPIB8 |
> +		      SCU_FUN_PIN_VPIB7 | SCU_FUN_PIN_VPIB6 |
> +		      SCU_FUN_PIN_VPIB5 | SCU_FUN_PIN_VPIB4 |
> +		      SCU_FUN_PIN_VPIB3 | SCU_FUN_PIN_VPIB2 |
> +		      SCU_FUN_PIN_VPIB1 | SCU_FUN_PIN_VPIB0 |
> +		      SCU_FUN_PIN_VPICLK | SCU_FUN_PIN_VPIVS |
> +		      SCU_FUN_PIN_VPIHS | SCU_FUN_PIN_VPIODD |
> +		      SCU_FUN_PIN_VPIDE ,AST_SCU_FUN_PIN_CTRL2);
>  
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
> -			SCU_FUN_PIN_VPIR9 | SCU_FUN_PIN_VPIR8 |
> -			SCU_FUN_PIN_VPIR7 | SCU_FUN_PIN_VPIR6 |
> -			SCU_FUN_PIN_VPIR5 | SCU_FUN_PIN_VPIR4 |
> -			SCU_FUN_PIN_VPIR3 | SCU_FUN_PIN_VPIR2 |
> -			SCU_FUN_PIN_VPIR1 | SCU_FUN_PIN_VPIR0 |
> -			SCU_FUN_PIN_VPIG9 | SCU_FUN_PIN_VPIG8 |
> -			SCU_FUN_PIN_VPIG7 | SCU_FUN_PIN_VPIG6 |
> -			SCU_FUN_PIN_VPIG5 | SCU_FUN_PIN_VPIG4 |
> -			SCU_FUN_PIN_VPIG3 | SCU_FUN_PIN_VPIG2 |
> -			SCU_FUN_PIN_VPIG1 | SCU_FUN_PIN_VPIG0
> ,AST_SCU_FUN_PIN_CTRL3);
> +		      SCU_FUN_PIN_VPIR9 | SCU_FUN_PIN_VPIR8 |
> +		      SCU_FUN_PIN_VPIR7 | SCU_FUN_PIN_VPIR6 |
> +		      SCU_FUN_PIN_VPIR5 | SCU_FUN_PIN_VPIR4 |
> +		      SCU_FUN_PIN_VPIR3 | SCU_FUN_PIN_VPIR2 |
> +		      SCU_FUN_PIN_VPIR1 | SCU_FUN_PIN_VPIR0 |
> +		      SCU_FUN_PIN_VPIG9 | SCU_FUN_PIN_VPIG8 |
> +		      SCU_FUN_PIN_VPIG7 | SCU_FUN_PIN_VPIG6 |
> +		      SCU_FUN_PIN_VPIG5 | SCU_FUN_PIN_VPIG4 |
> +		      SCU_FUN_PIN_VPIG3 | SCU_FUN_PIN_VPIG2 |
> +		      SCU_FUN_PIN_VPIG1 | SCU_FUN_PIN_VPIG0 ,
> +		      AST_SCU_FUN_PIN_CTRL3);
>  #endif
>  }
>  
>  
> -extern void
> -ast_scu_multi_nic_switch(u8 enable)
> +void ast_scu_multi_nic_switch(u8 enable)
>  {
> -	if(enable) {
> -		ast_scu_write((0x1 << 28) |
> ast_scu_read(AST_SCU_MAC_CLK), AST_SCU_MAC_CLK);
> -		ast_scu_write(~(0x1 << 11) &
> ast_scu_read(AST_SCU_RESET), AST_SCU_RESET);	//A1 ECO
> +	if (enable) {
> +		ast_scu_write((0x1 << 28) |
> ast_scu_read(AST_SCU_MAC_CLK),
> +			      AST_SCU_MAC_CLK);
> +		ast_scu_write(~(0x1 << 11) &
> ast_scu_read(AST_SCU_RESET),
> +			      AST_SCU_RESET);	/* A1 ECO */
>  	} else {
> -		ast_scu_write(~(0x1 << 28) &
> ast_scu_read(AST_SCU_MAC_CLK), AST_SCU_MAC_CLK);
> -		ast_scu_write((0x1 << 11) |
> ast_scu_read(AST_SCU_RESET), AST_SCU_RESET);
> +		ast_scu_write(~(0x1 << 28) &
> ast_scu_read(AST_SCU_MAC_CLK),
> +			      AST_SCU_MAC_CLK);
> +		ast_scu_write((0x1 << 11) |
> ast_scu_read(AST_SCU_RESET),
> +			      AST_SCU_RESET);

These could be rewirtten with BIT() macros, if you think that would
improve readability.

>  	}
>  
>  }
>  
> -extern void
> +void
>  ast_scu_multi_func_sgpio(void)
>  {
>  	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
> -			SCU_FUN_PIN_SGPMI |
> -			SCU_FUN_PIN_SGPMO |
> -			SCU_FUN_PIN_SGPMLD |
> -			SCU_FUN_PIN_SGPMCK, AST_SCU_FUN_PIN_CTRL2);
> +		      SCU_FUN_PIN_SGPMI |
> +		      SCU_FUN_PIN_SGPMO |
> +		      SCU_FUN_PIN_SGPMLD |
> +		      SCU_FUN_PIN_SGPMCK, AST_SCU_FUN_PIN_CTRL2);
>  
>  }
>  
>  
> -//***********************************Information
> ***********************************
> -extern u32
> -ast_scu_revision_id(void)
> +/***********************************Information
> *******************************/
> +u32 ast_scu_revision_id(void)
>  {
>  	int i;
>  	u32 rev_id = ast_scu_read(AST_SCU_REVISION_ID);
> -	for(i=0;i<ARRAY_SIZE(soc_map_table);i++) {
> -		if(rev_id == soc_map_table[i].rev_id)
> +
> +	for(i = 0; i < ARRAY_SIZE(soc_map_table); i++) {
> +		if (rev_id == soc_map_table[i].rev_id)
>  			break;
>  	}
> -	if(i == ARRAY_SIZE(soc_map_table))
> -		SCUMSG("UnKnow-SOC : %x \n",rev_id);
> +
> +	if (i == ARRAY_SIZE(soc_map_table))
> +		printf("UnKnow-SOC : %x \n",rev_id);
>  	else
> -		SCUMSG("SOC : %4s \n",soc_map_table[i].name);
> +		printf("SOC : %4s \n",soc_map_table[i].name);
>  
>  	return rev_id;
>  }
>  
> -
> -extern void
> -ast_scu_security_info(void)
> +void ast_scu_security_info(void)
>  {
>  	switch((ast_scu_read(AST_SCU_HW_STRAP2) >> 18) & 0x3) {
> -		case 1:
> -			printf("SEC : DSS Mode \n");
> -			break;
> -		case 2:
> -			printf("SEC : UnKnow \n");
> -			break;
> -		case 3:
> -			printf("SEC : SPI2 Mode \n");
> -			break;
> +	case 1:
> +		printf("SEC : DSS Mode \n");
> +		break;
> +	case 2:
> +		printf("SEC : UnKnow \n");
> +		break;
> +	case 3:
> +		printf("SEC : SPI2 Mode \n");
> +		break;
>  	}
>  
>  }
>  
> -extern void
> -ast_scu_sys_rest_info(void)
> +void ast_scu_sys_rest_info(void)
>  {
>  	u32 rest = ast_scu_read(AST_SCU_SYS_CTRL);
>  
> -#ifdef CONFIG_ARCH_AST1010
> -	if(rest & SCU_SYS_WDT_FULL_FLAG) {
> -		SCUMSG("RST : External \n");
> -		ast_scu_write(SCU_SYS_WDT_FULL_FLAG,
> AST_SCU_SYS_CTRL);
> -	} else if (rest & SCU_SYS_WDT_SOC_RESET) {
> -		SCUMSG("RST : Watchdog - SOC\n");
> -		ast_scu_write(SCU_SYS_WDT_SOC_RESET,
> AST_SCU_SYS_CTRL);
> -	} else if (rest & SCU_SYS_PWR_RESET_FLAG) {
> -		SCUMSG("RST : Power On \n");
> -		ast_scu_write(SCU_SYS_PWR_RESET_FLAG,
> AST_SCU_SYS_CTRL);
> -	} else {
> -	}
> -#else
>  	if(rest & SCU_SYS_EXT_RESET_FLAG) {
> -		SCUMSG("RST : External \n");
> +		printf("RST : External \n");
>  		ast_scu_write(SCU_SYS_EXT_RESET_FLAG,
> AST_SCU_SYS_CTRL);
>  	} else if (rest & SCU_SYS_WDT_RESET_FLAG) {
> -		SCUMSG("RST : Watchdog \n");
> +		printf("RST : Watchdog \n");
>  		ast_scu_write(SCU_SYS_WDT_RESET_FLAG,
> AST_SCU_SYS_CTRL);
>  	} else if (rest & SCU_SYS_PWR_RESET_FLAG) {
> -		SCUMSG("RST : Power On \n");
> +		printf("RST : Power On \n");
>  		ast_scu_write(SCU_SYS_PWR_RESET_FLAG,
> AST_SCU_SYS_CTRL);
>  	} else {
> -		SCUMSG("RST : CLK en \n");
> +		printf("RST : CLK en \n");
>  	}
> -#endif
>  }
>  
>  
>  /*
> -* D[15:11] in 0x1E6E2040 is NCSI scratch from U-Boot. D[15:14] =
> MAC1, D[13:12] = MAC2
> -* The meanings of the 2 bits are:
> -* 00(0): Dedicated PHY
> -* 01(1): ASPEED's EVA + INTEL's NC-SI PHY chip EVA
> -* 10(2): ASPEED's MAC is connected to NC-SI PHY chip directly
> -* 11: Reserved
> -*/
> -
> -extern u32
> -ast_scu_get_phy_config(u8 mac_num)
> + * D[15:11] in 0x1E6E2040 is NCSI scratch from U-Boot.
> + * D[15:14] = MAC1, D[13:12] = MAC2
> + *
> + * The meanings of the 2 bits are:
> + *   00(0): Dedicated PHY
> + *   01(1): ASPEED's EVA + INTEL's NC-SI PHY chip EVA
> + *   10(2): ASPEED's MAC is connected to NC-SI PHY chip directly
> + *   11   : Reserved
> + */
> +u32 ast_scu_get_phy_config(u8 mac_num)

We don't set these (I removed them from the driver iirc). They are used
by the aspeed sdk's u-boot to communicate the setting to the aspeed
kernel.

Once we get u-boot passing the device tree to the kernel, we could use
communicate this to the kernel via the device tree.

>  {
>  	u32 scatch = ast_scu_read(AST_SCU_SOC_SCRATCH0);
>  
>  	switch(mac_num) {
> -		case 0:
> -			return (SCU_MAC0_GET_PHY_MODE(scatch));
> -			break;
> -		case 1:
> -			return (SCU_MAC1_GET_PHY_MODE(scatch));
> -			break;
> -		default:
> -			SCUMSG("error mac number \n");
> -			break;
> +	case 0:
> +		return (SCU_MAC0_GET_PHY_MODE(scatch));
> +		break;
> +	case 1:
> +		return (SCU_MAC1_GET_PHY_MODE(scatch));
> +		break;
> +	default:
> +		printf("error mac number \n");
> +		break;
>  	}
>  	return -1;
>  }
>  
> -extern u32
> -ast_scu_get_phy_interface(u8 mac_num)
> +u32 ast_scu_get_phy_interface(u8 mac_num)
>  {
>  	u32 trap1 = ast_scu_read(AST_SCU_HW_STRAP1);

It's a (s)trap!

https://www.youtube.com/watch?v=4F4qzPbcFiA

Perhaps call it strap1?

>  
>  	switch(mac_num) {
> -		case 0:
> -			if(SCU_HW_STRAP_MAC0_RGMII & trap1)
> -				return 1;
> -			else
> -				return 0;
> -			break;
> -		case 1:
> -			if(SCU_HW_STRAP_MAC1_RGMII & trap1)
> -				return 1;
> -			else
> -				return 0;
> -			break;
> -		default:
> -			SCUMSG("error mac number \n");
> -			break;
> +	case 0:
> +		if(SCU_HW_STRAP_MAC0_RGMII & trap1)
> +			return 1;
> +		else
> +			return 0;
> +		break;
> +	case 1:
> +		if(SCU_HW_STRAP_MAC1_RGMII & trap1)
> +			return 1;
> +		else
> +			return 0;
> +		break;
> +	default:
> +		printf("error mac number \n");
> +		break;
>  	}
>  	return -1;

we're returning -1 in an u32. That doesn't seem correct.

>  }
>  
> -extern void
> -ast_scu_set_vga_display(u8 enable)
> +void ast_scu_set_vga_display(u8 enable)
>  {
>  	if(enable)
> -		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) &
> ~SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
> +		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) &
> +			      ~SCU_MISC_VGA_CRT_DIS,
> AST_SCU_MISC1_CTRL);
>  	else
> -		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) |
> SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
> +		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) |
> +			      SCU_MISC_VGA_CRT_DIS,
> AST_SCU_MISC1_CTRL);
>  }
>  
> -
> -extern u8
> -ast_scu_get_vga_display(void)
> +u8 ast_scu_get_vga_display(void)
>  {
>  	if(ast_scu_read(AST_SCU_MISC1_CTRL) & SCU_MISC_VGA_CRT_DIS)
>  		return 0;
> @@ -1813,88 +1709,83 @@ ast_scu_get_vga_display(void)
>  		return 1;
>  }
>  
> -
> -extern u32
> -ast_scu_get_vga_memsize(void)
> +u32 ast_scu_get_vga_memsize(void)
>  {
>  	u32 size=0;
>  
> -	switch(SCU_HW_STRAP_VGA_SIZE_GET(ast_scu_read(AST_SCU_HW_STR
> AP1))) {
> -		case VGA_8M_DRAM:
> -			size = 8*1024*1024;
> -			break;
> -		case VGA_16M_DRAM:
> -			size = 16*1024*1024;
> -			break;
> -		case VGA_32M_DRAM:
> -			size = 32*1024*1024;
> -			break;
> -		case VGA_64M_DRAM:
> -			size = 64*1024*1024;
> -			break;
> -		default:
> -			SCUMSG("error vga size \n");
> -			break;
> +	switch
> (SCU_HW_STRAP_VGA_SIZE_GET(ast_scu_read(AST_SCU_HW_STRAP1))) {
> +	case VGA_8M_DRAM:
> +		size = 8*1024*1024;
> +		break;
> +	case VGA_16M_DRAM:
> +		size = 16*1024*1024;
> +		break;
> +	case VGA_32M_DRAM:
> +		size = 32*1024*1024;
> +		break;
> +	case VGA_64M_DRAM:
> +		size = 64*1024*1024;
> +		break;
> +	default:
> +		printf("error vga size \n");
> +		break;
>  	}
>  	return size;
>  }
>  
>  
> -extern u32
> -ast_scu_get_soc_dram_base(void)
> +u32 ast_scu_get_soc_dram_base(void)
>  {
>  	u32 rev_id = ast_scu_read(AST_SCU_REVISION_ID);
> -	if((rev_id >> AST_SOC_GEN) > 3)
> +
> +	if ((rev_id >> AST_SOC_GEN) > 3)
>  		return AST_DRAM_BASE_8;
>  	else
>  		return AST_DRAM_BASE_4;
>  }
>  
> -extern void
> -ast_scu_get_who_init_dram(void)
> +void ast_scu_get_who_init_dram(void)
>  {
>  	switch(SCU_VGA_DRAM_INIT_MASK(ast_scu_read(AST_SCU_VGA0))) {
> -		case 0:
> -			printf("DRAM :   init by VBIOS \n");
> -			break;
> -		case 1:
> -			printf("DRAM :   init by SOC \n");
> -			break;
> -		default:
> -			printf("error vga size \n");
> -			break;
> +	case 0:
> +		printf("DRAM :   init by VBIOS \n");
> +		break;
> +	case 1:
> +		printf("DRAM :   init by SOC \n");
> +		break;
> +	default:
> +		printf("error vga size \n");
> +		break;
>  	}
>  }
>  
> -extern u8
> -ast_scu_adc_trim_read(void)
> +u8 ast_scu_adc_trim_read(void)
>  {
>  	return (ast_scu_read(AST_SCU_OTP1) >> 28);
>  }
>  
> -extern void
> -ast_scu_hw_random_enable(u8 enable)
> +void ast_scu_hw_random_enable(u8 enable)
>  {
>  	if(enable)
> -		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) |
> RNG_ENABLE, AST_SCU_RAMDOM_GEN);
> +		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) |
> RNG_ENABLE,
> +			      AST_SCU_RAMDOM_GEN);
>  	else
> -		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) &
> ~RNG_ENABLE, AST_SCU_RAMDOM_GEN);
> +		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) &
> ~RNG_ENABLE,
> +			      AST_SCU_RAMDOM_GEN);
>  }
>  
> -extern u32
> -ast_scu_hw_random_read(void)
> +u32 ast_scu_hw_random_read(void)
>  {
>  	return (ast_scu_read(AST_SCU_RAMDOM_DATA));
>  }
>  
> -extern u8
> -ast_scu_get_hw_random_type(void)
> +u8 ast_scu_get_hw_random_type(void)
>  {
>  	return (RNG_GET_TYPE(ast_scu_read(AST_SCU_RAMDOM_GEN)));
>  }
>  
> -extern void
> -ast_scu_set_hw_random_type(u8 type)
> +void ast_scu_set_hw_random_type(u8 type)
>  {
> -	ast_scu_write(((ast_scu_read(AST_SCU_RAMDOM_GEN) &
> ~RNG_TYPE_MASK) | RNG_SET_TYPE(type)), AST_SCU_RAMDOM_GEN);
> +	ast_scu_write(((ast_scu_read(AST_SCU_RAMDOM_GEN) &
> ~RNG_TYPE_MASK) |
> +		       RNG_SET_TYPE(type)), AST_SCU_RAMDOM_GEN);
>  }
> diff --git a/arch/arm/mach-aspeed/ast-sdmc.c b/arch/arm/mach-
> aspeed/ast-sdmc.c
> index 6ac891532bdb..10f3ddb829bb 100644
> --- a/arch/arm/mach-aspeed/ast-sdmc.c
> +++ b/arch/arm/mach-aspeed/ast-sdmc.c
> @@ -1,24 +1,29 @@
> -/*******************************************************************
> *************
> -* File Name     : arch/arm/mach-aspeed/ast-sdmc.c
> -* Author         : Ryan Chen
> -* Description   : AST SDRAM Memory Ctrl
> -*
> -* Copyright (C) 2012-2020  ASPEED Technology Inc.
> -* This program is free software; you can redistribute it and/or
> modify
> -* it under the terms of the GNU General Public License as published
> by the Free Software Foundation;
> -* either version 2 of the License, or (at your option) any later
> version.
> -* This program is distributed in the hope that it will be
> useful,  but WITHOUT ANY WARRANTY;
> -* without even the implied warranty of MERCHANTABILITY or
> -* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
> License for more details.
> -* You should have received a copy of the GNU General Public License
> -* along with this program; if not, write to the Free Software
> -* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-
> 1307 USA
> -
> -
> -*   History      :
> -*    1. 2013/03/15 Ryan Chen Create
> -*
> -********************************************************************
> ************/
> +/*******************************************************************
> ************

Delete the ascii art while we're here.

> + * File Name     : arch/arm/mach-aspeed/ast-sdmc.c
> + * Author        : Ryan Chen
> + * Description   : AST SDRAM Memory Ctrl
> + *
> + * Copyright (C) 2012-2020  ASPEED Technology Inc.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> the
> + * License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-
> 1307
> + * USA
> + *
> + *   History      :
> + *    1. 2013/03/15 Ryan Chen Create
> + *
> +
> *********************************************************************
> *********/
>  #include <common.h>
>  #include <asm/processor.h>
>  #include <asm/io.h>
> @@ -28,125 +33,67 @@
>  #include <asm/arch/ast-sdmc.h>
>  
>  //#define AST_SDMC_LOCK
> -//#define AST_SDMC_DEBUG
> -
> -#ifdef AST_SDMC_DEBUG
> -#define SDMCDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ##
> args)
> -#else
> -#define SDMCDBUG(fmt, args...)
> -#endif
>  
> -#define SDMCMSG(fmt, args...) printf(fmt, ## args)
> -
> -static u32 ast_sdmc_base = AST_SDMC_BASE;
> -
> -static inline u32
> -ast_sdmc_read(u32 reg)
> +static inline u32 ast_sdmc_read(u32 reg)
>  {
> -	u32 val;
> -
> -	val = readl(ast_sdmc_base + reg);
> -
> -	SDMCDBUG("ast_sdmc_read : reg = 0x%08x, val = 0x%08x\n",
> reg, val);
> +	u32 val = readl(AST_SDMC_BASE + reg);
>  
> +	debug("ast_sdmc_read : reg = 0x%08x, val = 0x%08x\n", reg,
> val);
>  	return val;
>  }
>  
> -static inline void
> -ast_sdmc_write(u32 val, u32 reg)
> +static inline void ast_sdmc_write(u32 val, u32 reg)
>  {
> -	SDMCDBUG("ast_sdmc_write : reg = 0x%08x, val = 0x%08x\n",
> reg, val);
> +	debug("ast_sdmc_write : reg = 0x%08x, val = 0x%08x\n", reg,
> val);
>  #ifdef CONFIG_AST_SDMC_LOCK
>  	//unlock
> -	writel(SDMC_PROTECT_UNLOCK, ast_sdmc_base);
> -	writel(val, ast_sdmc_base + reg);
> +	writel(SDMC_PROTECT_UNLOCK, AST_SDMC_BASE);
> +	writel(val, AST_SDMC_BASE + reg);
>  	//lock
> -	writel(0xaa,ast_sdmc_base);
> +	writel(0xaa, AST_SDMC_BASE);
>  #else
> -	writel(SDMC_PROTECT_UNLOCK, ast_sdmc_base);
> +	writel(SDMC_PROTECT_UNLOCK, AST_SDMC_BASE);
>  
> -	writel(val, ast_sdmc_base + reg);
> +	writel(val, AST_SDMC_BASE + reg);
>  #endif
>  }
>  
> -//***********************************Information
> ***********************************
> -#ifdef CONFIG_ARCH_AST1010
> -extern u32
> -ast_sdmc_get_mem_size(void)
> -{
> -	if(ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_16MB) {
> -		return PHYS_SDRAM_12M;
> -	} else {
> -		return PHYS_SDRAM_8M;
> -	}
> -}
> -#else
> -extern u32
> -ast_sdmc_get_mem_size(void)
> +u32 ast_sdmc_get_mem_size(void)
>  {
> -	u32 size=0;
> +	u32 size = 0;
>  	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
>  
> -	if(conf & SDMC_CONFIG_VER_NEW) {
> -		switch(SDMC_CONFIG_MEM_GET(conf)) {
> -			case 0:
> -				size = 128*1024*1024;
> -				break;
> -			case 1:
> -				size = 256*1024*1024;
> -				break;
> -			case 2:
> -				size = 512*1024*1024;
> -				break;
> -			case 3:
> -				size = 1024*1024*1024;
> -				break;
> -
> -			default:
> -				SDMCMSG("error ddr size \n");
> -				break;
> -		}
> -
> -	} else {
> -		switch(SDMC_CONFIG_MEM_GET(conf)) {
> -			case 0:
> -				size = 64*1024*1024;
> -				break;
> -			case 1:
> -				size = 128*1024*1024;
> -				break;
> -			case 2:
> -				size = 256*1024*1024;
> -				break;
> -			case 3:
> -				size = 512*1024*1024;
> -				break;
> +	switch (SDMC_CONFIG_MEM_GET(conf)) {
> +	case 0:
> +		size = 64;
> +		break;
> +	case 1:
> +		size = 128;
> +		break;
> +	case 2:
> +		size = 256;
> +		break;
> +	case 3:
> +		size = 512;
> +		break;
> +	default:
> +		printf("error ddr size \n");
> +		break;
> +	}
>  
> -			default:
> -				SDMCMSG("error ddr size \n");
> -				break;
> -		}
> +	if (conf & SDMC_CONFIG_VER_NEW) {
> +		size <<= 1;
>  	}
> -	return size;
> +
> +	return size * 1024 * 1024;
>  }
> -#endif
>  
> -extern u8
> -ast_sdmc_get_eec(void)
> +u8 ast_sdmc_get_eec(void)
>  {
> -	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
> -	if(conf & SDMC_CONFIG_EEC_EN)
> -		return 1;
> -	else
> -		return 0;
> +	return ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_EEC_EN;
>  }
>  
> -extern u8
> -ast_sdmc_get_cache(void)
> +u8 ast_sdmc_get_cache(void)
>  {
> -	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
> -	if(conf & SDMC_CONFIG_CACHE_EN)
> -		return 1;
> -	else
> -		return 0;
> +	return ast_sdmc_read(AST_SDMC_CONFIG) &
> SDMC_CONFIG_CACHE_EN;
>  }

This isn't equivalent. I think you want to do:

 return (ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_CACHE_EN) == 1;

or

 return !!(ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_CACHE_EN);

Or make the return type a bool. Same for ast_sdmc_get_eec above.


> diff --git a/arch/arm/mach-aspeed/cpuinfo.c b/arch/arm/mach-
> aspeed/cpuinfo.c
> index 96d2de5a416a..45f70a81833f 100644
> --- a/arch/arm/mach-aspeed/cpuinfo.c
> +++ b/arch/arm/mach-aspeed/cpuinfo.c
> @@ -1,7 +1,7 @@
>  /*
>   * This file is released under the terms of GPL v2 and any later
> version.
>   * See the file COPYING in the root directory of the source tree for
> details.
> -*/
> + */
>  
>  #include <common.h>
>  #include <command.h>
> @@ -10,7 +10,6 @@
>  #include <asm/arch/ast-sdmc.h>
>  #include <asm/arch/aspeed.h>
>  
> -
>  #if defined(CONFIG_DISPLAY_CPUINFO)
>  int print_cpuinfo(void)
>  {
> @@ -24,26 +23,24 @@ int print_cpuinfo(void)
>  #ifdef AST_SOC_G5
>  	ast_scu_security_info();
>  #endif
> -
> -	printf("PLL :   %4s MHz\n",
> -					strmhz(buf,
> ast_get_clk_source()));
> -	printf("CPU :   %4s MHz\n",
> -					strmhz(buf,
> ast_get_h_pll_clk()));
> +	printf("PLL :   %4s MHz\n", strmhz(buf,
> ast_get_clk_source()));
> +	printf("CPU :   %4s MHz\n", strmhz(buf,
> ast_get_h_pll_clk()));
>  #ifdef AST_SOC_G5
>  	printf("MEM :	%4s MHz, EEC: %s, Cache: %s \n",
> -					strmhz(buf,
> ast_get_m_pll_clk() * 2), ast_sdmc_get_eec() ?
> "Enable":"Disable",ast_sdmc_get_cache() ?"Enable":"Disable");
> +	       strmhz(buf, ast_get_m_pll_clk() * 2),
> +	       ast_sdmc_get_eec() ? "Enable" : "Disable",
> +	       ast_sdmc_get_cache() ? "Enable" : "Disable");
>  #else
>  	printf("MEM :   %4s MHz, EEC:%s \n",
> -					strmhz(buf,
> ast_get_m_pll_clk()), ast_sdmc_get_eec() ? "Enable":"Disable");
> +	       strmhz(buf, ast_get_m_pll_clk()),
> +	       ast_sdmc_get_eec() ? "Enable" : "Disable");
>  #endif
>  	size = ast_scu_get_vga_memsize();
>  
>  	puts("VGA :    ");
> -
>  	print_size(size, "\n");
>  
>  	ast_scu_get_who_init_dram();
> -
>  	return 0;
>  }
>  #endif
> diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-
> aspeed/timer.c
> index f1109acbe108..626f992429b6 100644
> --- a/arch/arm/mach-aspeed/timer.c
> +++ b/arch/arm/mach-aspeed/timer.c
> @@ -37,7 +37,7 @@ static ulong lastdec;
>  int timer_init (void)
>  {
>  	*(volatile ulong *)(AST_TIMER_BASE + 4)    = TIMER_LOAD_VAL;
> -	*(volatile ulong *)(AST_TIMER_BASE + 0x30) = 0x3;		
> /* enable timer1 */
> +	*(volatile ulong *)(AST_TIMER_BASE + 0x30) = 0x3; /* enable
> timer1 */
>  
>  	/* init the timestamp and lastdec value */
>  	reset_timer_masked();
