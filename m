Return-Path: <maxims@google.com>
Received: from mail-yb0-x22f.google.com (mail-yb0-x22f.google.com
 [IPv6:2607:f8b0:4002:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sTq6X1byXzDsFv
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 02:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ZlI8gaqq; 
 dkim-atps=neutral
Received: by mail-yb0-x22f.google.com with SMTP id x93so7944220ybh.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2016 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=94MqWxG7ZJeAch63NzpEwy0tThFxOusIAsocfMyR9cY=;
 b=ZlI8gaqqRbiTsI4F/dUVjGfGeWH6juMNe/JngQrRHYci3mH/jmw55rJAjGx9UMe+iB
 tGI/pgPOzFhhox317hOi9zBZb0ZFwqeMlnM1miEYwEectSZ0paZcZBa6cTQNc06VlHTz
 +kf9ylWMBlP+TI02DSCqpcdSNpzVf+/Qka8LqCp8JoLXZ7qO3NlEvA+5oNDBSsk+dKk9
 0gGn5UKJfs46jt69ZioG/OW096oHVBkF7ZgVqhSXnUoO6755pLuLzVmsYhRqJVRyeEwV
 k01hweMCaSycTcOTxnar2Ug+VeTWHHcxTcbXbmc+gg0zzFPnCU3LZUaAthkuy3Vlhgr6
 6jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=94MqWxG7ZJeAch63NzpEwy0tThFxOusIAsocfMyR9cY=;
 b=LtjE0dtYw4OQQSrOkTvjTWhzR1ezWnHUmQNMXhI+GbJQUNYgvIO5IyyW2aLAqkUDcp
 NTyIbM4o0FROEH5MWnpux4ga/CWApwMnjY6NlD+u3HyculZbAGAGimtEaSB7UiDfLlJU
 /SqiDyAm0Rn+PICy5wR6UkMG4FN9arP5UsV2nWpsvHN7uStZ4+UpZhcuQ5gNF6QGEY8s
 BFUpuFZaRS1Pet9vhJ382g3PDN1MMril+4z6JhVxZ0u8siqy9vkxg0u2DqetB3jE5V8S
 JbUzwjcyB5WPOP1LJs/SDQPor4wMZmFpaY68TciDNiDoxVoo14vhmv4IlsFhPrFvOV11
 l5Ng==
X-Gm-Message-State: AE9vXwOgQHXyoFAn4mcSWsx0hl4OKgrVbYmg2YDyzYVgnkzL8RimTTaLRmQ32GjGudZk+DrhVx31LBib3G+Yxgxj
X-Received: by 10.37.97.142 with SMTP id v136mr18003716ybb.84.1473266624955;
 Wed, 07 Sep 2016 09:43:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.199.210 with HTTP; Wed, 7 Sep 2016 09:43:44 -0700 (PDT)
In-Reply-To: <1472839086-30137-1-git-send-email-maxims@google.com>
References: <1472839086-30137-1-git-send-email-maxims@google.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 7 Sep 2016 09:43:44 -0700
Message-ID: <CAFR_W8pNpwn7ed8fzw95bUkmqz=hK_zzWtKf8dkPwKawNckMJw@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Added ast_uart.{c, h} files, moved most of
 the diagnostic message printing to ast-g5.c
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a1142e87ed79f2e053bed9dce
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
X-List-Received-Date: Wed, 07 Sep 2016 16:43:49 -0000

--001a1142e87ed79f2e053bed9dce
Content-Type: text/plain; charset=UTF-8

Ping!

On Fri, Sep 2, 2016 at 10:58 AM, <maxims@google.com> wrote:

> From: Maxim Sloyko <maxims@google.com>
>
> Set up a stack in SRAM at the beginning of lowlevel_init, which makes it
> possible to call non-trivial C functions, as well as put diagnostic
> strings themselves onto the stack.
>
> Several one-char writes to debug uart still remain in platform.S, I
> figured it's not worth it to make a separate call to c function for each
> of those.
> ---
>  arch/arm/include/asm/arch-aspeed/ast_uart.h | 142 +++++++++++
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |   4 +-
>  arch/arm/mach-aspeed/Makefile               |   2 +-
>  arch/arm/mach-aspeed/ast_uart.c             |  38 +++
>  board/aspeed/ast-g5/ast-g5.c                | 110 ++++++++-
>  board/aspeed/ast-g5/platform.S              | 351
> +++-------------------------
>  6 files changed, 318 insertions(+), 329 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-aspeed/ast_uart.h
>  create mode 100644 arch/arm/mach-aspeed/ast_uart.c
>
> diff --git a/arch/arm/include/asm/arch-aspeed/ast_uart.h
> b/arch/arm/include/asm/arch-aspeed/ast_uart.h
> new file mode 100644
> index 0000000..ddf1a14
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-aspeed/ast_uart.h
> @@ -0,0 +1,142 @@
> +/**********************************************************
> *********************
> + * Copyright (C) 2016 Google Inc
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + * USA
> + ************************************************************
> ******************/
> +
> +#ifndef __AST_UART_H
> +#define __AST_UART_H
> +
> +#include <asm/io.h>
> +
> +#define AST_UART_RBR(uart)      (uart)
> +#define AST_UART_THR(uart)      (uart)
> +#define AST_UART_IER(uart)      ((uart) + 0x4)
> +#define AST_UART_IIR(uart)      ((uart) + 0x8)
> +#define AST_UART_FCR(uart)      ((uart) + 0x8)
> +#define AST_UART_LCR(uart)      ((uart) + 0xc)
> +#define AST_UART_MCR(uart)      ((uart) + 0x10)
> +#define AST_UART_LSR(uart)      ((uart) + 0x14)
> +#define AST_UART_MSR(uart)      ((uart) + 0x18)
> +#define AST_UART_SCR(uart)      ((uart) + 0x1c)
> +
> +/* These registers can only be written when DLAB = 1*/
> +#define AST_UART_DLL(uart)      ((uart))
> +#define AST_UART_DLH(uart)      ((uart) + 0x4)
> +
> +/* Registers' contents */
> +
> +#define AST_UART_IER_THRE       (1 << 7)
> +#define AST_UART_IER_EDSSI      (1 << 3)
> +#define AST_UART_IER_ELSI       (1 << 2)
> +#define AST_UART_IER_ETBEI      (1 << 1)
> +#define AST_UART_IER_ERBFI      (1 << 0)
> +
> +/* AND this mask with AST_UART_IIR to find out if FIFOs are enabled. */
> +#define AST_UART_IIR_FEN_MASK   (3 << 6)
> +
> +/* Bit0 == 0 means that the interrupt is pending, bits 3:1 identify
> + * interrupt.  These values are defined so that IIR | 0xf would give you
> the
> + * value for the interrupt. */
> +#define AST_UART_IIR_MSC        (0)
> +#define AST_UART_IIR_THRE       (1 << 1)
> +#define AST_UART_IIR_RDA        (2 << 1)
> +#define AST_UART_IIR_RS         (3 << 1)
> +#define AST_UART_IIR_CTO        (6 << 1)
> +
> +/* RX FIFO Interrupt trigger level */
> +#define AST_UART_FCR_RXFITL_MASK    (3 << 6)
> +/* One byte received */
> +#define AST_UART_FCR_RXFITL1    (0)
> +/* 4 bytes received */
> +#define AST_UART_FCR_RXFITL4    (1 << 6)
> +/* 8 bytes received */
> +#define AST_UART_FCR_RXFITL8    (2 << 6)
> +/* 14 bytes received */
> +#define AST_UART_FCR_RXFITL14   (3 << 6)
> +
> +/* TX FIFO Interrupt trigger level */
> +#define AST_UART_FCR_TXFITL_MASK    (3 << 4)
> +/* FIFO Empty (0 bytes in FIFO) */
> +#define AST_UART_FCR_TXFITL0    (0)
> +/* 2 bytes in FIFO */
> +#define AST_UART_FCR_TXFITL2    (1 << 4)
> +/* FIFO 1/4 full (4 bytes) */
> +#define AST_UART_FCR_TXFITLQ    (2 << 4)
> +/* FIFO 1/2 full (8 bytes) */
> +#define AST_UART_FCR_TXFITLH    (3 << 4)
> +
> +#define AST_UART_FCR_TXFRST     (1 << 2)
> +#define AST_UART_FCR_RXFRST     (1 << 1)
> +#define AST_UART_FCR_FEN        (1 << 0)
> +
> +#define AST_UART_LCR_DLAB       (1 << 7)
> +#define AST_UART_LCR_BC         (1 << 6)
> +#define AST_UART_LCR_EPS        (1 << 4)
> +#define AST_UART_LCR_PEN        (1 << 3)
> +#define AST_UART_LCR_STOP       (1 << 2)
> +
> +/* Number of bits per character */
> +#define AST_UART_LCR_BPC_MASK   (3)
> +#define AST_UART_LCR_BPC5       (0)
> +#define AST_UART_LCR_BPC6       (1)
> +#define AST_UART_LCR_BPC7       (2)
> +#define AST_UART_LCR_BPC8       (3)
> +
> +#define AST_UART_MCR_LB         (1 << 4)
> +#define AST_UART_MCR_OUT2       (1 << 3)
> +#define AST_UART_MCR_OUT1       (1 << 2)
> +#define AST_UART_MCR_RTS        (1 << 1)
> +#define AST_UART_MCR_DTR        (1 << 0)
> +
> +#define AST_UART_LSR_ERXF       (1 << 7)
> +#define AST_UART_LSR_TEMPTY     (1 << 6)
> +#define AST_UART_LSR_THRE       (1 << 5)
> +#define AST_UART_LSR_BI         (1 << 4)
> +#define AST_UART_LSR_FE         (1 << 3)
> +#define AST_UART_LSR_PE         (1 << 2)
> +#define AST_UART_LSR_OE         (1 << 1)
> +#define AST_UART_LSR_DR         (1 << 0)
> +
> +#define AST_UART_MSR_NDCD_OUT2  (1 << 7)
> +#define AST_UART_MSR_NRI_OUT1   (1 << 6)
> +#define AST_UART_MSR_NDSR_NDTR  (1 << 5)
> +#define AST_UART_MSR_NCTS_NRTS  (1 << 4)
> +#define AST_UART_MSR_DDCD       (1 << 3)
> +#define AST_UART_MSR_TERI       (1 << 2)
> +#define AST_UART_MSR_DDSR       (1 << 1)
> +#define AST_UART_MSR_DCTS       (1 << 0)
> +
> +#define AST_UART_FIFO_SIZE      (16)
> +
> +#define ast_uart_wait_txempty(uart) while(!(readl(AST_UART_LSR((uart)))
> & AST_UART_LSR_TEMPTY))
> +#define ast_uart_write(uart, c)     writel((c), AST_UART_THR((uart)))
> +#define ast_uart_enable_fifo(uart)  setbits_le32(AST_UART_FCR((uart)),
> AST_UART_FCR_FEN)
> +#define ast_uart_enable_thre_mode(uart) setbits_le32(AST_UART_IER(uart),
> AST_UART_IER_THRE)
> +
> +/* In THRE and FIFO mode, wait until there is some space in FIFO */
> +#define ast_uart_wait_fifo_ready(uart) while((readl(AST_UART_LSR(uart))
> & AST_UART_LSR_THRE))
> +
> +#define ast_uart_set_bpc(uart, bpc) clrsetbits_le32(AST_UART_LCR((uart)),
> AST_UART_LCR_BPC_MASK, (bpc))
> +
> +#define ast_uart_unlock_dlab(uart) setbits_le32(AST_UART_LCR((uart)),
> AST_UART_LCR_DLAB)
> +#define ast_uart_lock_dlab(uart) clrbits_le32(AST_UART_LCR(uart),
> AST_UART_LCR_DLAB)
> +
> +/* NOTE: These write functions only work when THRE mode and FIFOs are
> enabled. */
> +void ast_uart_write_buffer_sync(uint32_t uart, const uint8_t* buffer,
> uint16_t len);
> +void ast_uart_write_string_sync(uint32_t uart, const char* s);
> +
> +#endif
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b89df82..b714fa9 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -10,8 +10,8 @@
>   *    1. 2012/12/29 Ryan Chen Create
>   *
>  ************************************************************
> ********************/
> -#ifndef __AST_SCU_H
> -#define __AST_SCU_H                     1
> +#ifndef __AST_REGS_SCU_H
> +#define __AST_REGS_SCU_H                     1
>
>  #include <asm/arch/aspeed.h>
>
> diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
> index d72f62a..3e0b4f7 100644
> --- a/arch/arm/mach-aspeed/Makefile
> +++ b/arch/arm/mach-aspeed/Makefile
> @@ -11,5 +11,5 @@
>  #
>
>
> -obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
> +obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
> ast_uart.o
>  obj-$(CONFIG_AST_SPI_NOR) += flash.o
> diff --git a/arch/arm/mach-aspeed/ast_uart.c b/arch/arm/mach-aspeed/ast_
> uart.c
> new file mode 100644
> index 0000000..1226827
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/ast_uart.c
> @@ -0,0 +1,38 @@
> +/**********************************************************
> *********************
> + * Copyright (C) 2016 Google Inc
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> + * USA
> + ************************************************************
> ******************/
> +
> +#include <asm/io.h>
> +#include <asm/arch/ast_uart.h>
> +
> +void ast_uart_write_buffer_sync(uint32_t uart, const uint8_t *buffer,
> +                               uint16_t len)
> +{
> +       for (; len; --len, ++buffer) {
> +               ast_uart_wait_fifo_ready(uart);
> +               ast_uart_write(uart, *buffer);
> +       }
> +}
> +
> +void ast_uart_write_string_sync(uint32_t uart, const char *s)
> +{
> +       for (; *s; ++s) {
> +               ast_uart_wait_fifo_ready(uart);
> +               ast_uart_write(uart, *s);
> +       }
> +}
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index 81ea88a..b0b8535 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -35,16 +35,21 @@
>
>  #include <common.h>
>  #include <netdev.h>
> -#include <asm/arch/ast_scu.h>
> +#include <asm/arch/ast_g5_platform.h>
>  #include <asm/arch/ast-sdmc.h>
> +#include <asm/arch/ast_scu.h>
> +#include <asm/arch/ast_uart.h>
> +#include <asm/arch/regs-scu.h>
>  #include <asm/io.h>
>
> +#define AST_DEBUG_UART      (0x1e784000)
> +
>  DECLARE_GLOBAL_DATA_PTR;
>
>  #if defined(CONFIG_SHOW_BOOT_PROGRESS)
>  void show_boot_progress(int progress)
>  {
> -    printf("Boot reached stage %d\n", progress);
> +       printf("Boot reached stage %d\n", progress);
>  }
>  #endif
>
> @@ -66,9 +71,108 @@ int dram_init(void)
>         return 0;
>  }
>
> +/* assumes digit < 16 */
> +static inline char hex_digit(uint8_t digit)
> +{
> +       if (digit < 10) {
> +               return '0' + digit;
> +       } else {
> +               return 'a' + (digit - 10);
> +       }
> +}
> +
> +static inline void format_u8_hex(char *dst, uint8_t value)
> +{
> +       *dst = hex_digit(value >> 4);
> +       *(dst + 1) = hex_digit(value & 0xf);
> +}
> +
> +static inline void debug_uart_print(const char *s)
> +{
> +       ast_uart_write_string_sync(AST_DEBUG_UART, s);
> +}
> +
> +void debug_print_ddr_version(uint8_t version)
> +{
> +       char message[8] = "-DDR_\r\n";
> +       message[4] = '0' + version;
> +       debug_uart_print(message);
> +}
> +
> +void debug_print_dram_init_message(uint8_t version)
> +{
> +       char message[16] = "\r\nDRAM Init-V__";
> +       char *version_dst = message + 13;
> +       format_u8_hex(version_dst, version);
> +       debug_uart_print(message);
> +}
> +
> +void debug_print_dram_size(char size)
> +{
> +       char message[6] = "-_Gb-";
> +       message[1] = size;
> +       debug_uart_print(message);
> +}
> +
> +void debug_print_ddr_status(bool done)
> +{
> +       if (done) {
> +               debug_uart_print("Done\r\n");
> +       } else {
> +               debug_uart_print("Fail\r\n");
> +       }
> +}
> +
> +static inline void format_phy_timing(char *dst, uint8_t value)
> +{
> +       /* This is adopted from platforms.S file by Aspeed.
> +        * They read memory address (which is not mentioned in the data
> sheet)
> +        * and then divide byte value by 510 and print 4 digits after the
> dot.
> +        */
> +       uint32_t timing_value = value * 1000 / 51;
> +       for (int index = 3; index >= 0 && timing_value > 0; --index) {
> +               uint8_t digit = timing_value % 10;
> +               timing_value /= 10;
> +               dst[index] = '0' + digit;
> +       }
> +}
> +
> +void debug_print_ddr_phy_timing(uint16_t margin)
> +{
> +       char message[46] = "Read margin DL:0.0000/0.0000 CK (min:
> 0.35)\r\n";
> +       format_phy_timing(message + 17, margin & 0xff);
> +       format_phy_timing(message + 24, (margin >> 8) & 0xff);
> +       debug_uart_print(message);
> +}
> +
> +static void init_uart_for_debug(uint32_t uart_base)
> +{
> +       ast_uart_set_bpc(uart_base, AST_UART_LCR_BPC8);
> +       ast_uart_unlock_dlab(uart_base);
> +       const uint32_t uart_clk_mul =
> +           readl(AST_SCU_BASE + AST_SCU_MISC1_CTRL) & (1 << 12) ? 1 : 13;
> +#ifdef CONFIG_DRAM_UART_38400
> +       const uint32_t br_base = 3 * uart_clk_mul;
> +#else
> +       const uint32_t br_base = 1 * uart_clk_mul;
> +#endif
> +       writel(br_base, AST_UART_DLL(uart_base));
> +       writel(0, AST_UART_DLH(uart_base));
> +
> +       /* Lock DLAB */
> +       ast_uart_lock_dlab(uart_base);
> +       ast_uart_enable_fifo(uart_base);
> +       ast_uart_enable_thre_mode(uart_base);
> +}
> +
> +void init_debug_uart(void)
> +{
> +       init_uart_for_debug(AST_DEBUG_UART);
> +}
> +
>  #ifdef CONFIG_CMD_NET
>  int board_eth_init(bd_t *bd)
>  {
> -        return ftgmac100_initialize(bd);
> +       return ftgmac100_initialize(bd);
>  }
>  #endif
> diff --git a/board/aspeed/ast-g5/platform.S b/board/aspeed/ast-g5/
> platform.S
> index c810f44..a33afee 100644
> --- a/board/aspeed/ast-g5/platform.S
> +++ b/board/aspeed/ast-g5/platform.S
> @@ -78,7 +78,6 @@
>  #include <version.h>
>
>  /***********************************************************
> *******************
> -  r4 : return program counter
>    r5 : DDR speed timing table base address
>    Free registers:
>    r0, r1, r2, r3, r6, r7, r8, r9, r10, r11
> @@ -104,6 +103,9 @@
>  #define ASTMMC_REGIDX_RFC    0x3C
>  #define ASTMMC_REGIDX_PLL    0x40
>
> +#define AST_SRAM_END  0x1e728ffc
> +
> +
>  TIME_TABLE_DDR3_1333:
>      .word   0x53503C37       @ 0x010
>      .word   0xF858D47F       @ 0x014
> @@ -242,12 +244,20 @@ TIME_TABLE_DDR4_1600:
>   Calibration Macro End
>   ************************************************************
> ******************/
>
> +.globl debug_print_dram_init_message
> +.globl debug_print_ddr_version
> +.globl debug_print_dram_size
> +.globl debug_print_ddr_status
> +.globl debug_print_ddr_phy_timing
> +.globl init_debug_uart
>  .globl lowlevel_init
>  lowlevel_init:
>
>  init_dram:
> +    /* Setup a stack in SRAM */
> +    ldr   sp, =AST_SRAM_END
>      /* save lr */
> -    mov   r4, lr
> +    push  {lr}
>
>      /* Clear AHB bus lock condition */
>      ldr   r0, =0x1e600000
> @@ -489,82 +499,10 @@ wait_mmc_reset_done:
>      ldr   r1, =0x00020000
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e78400c
> -    mov   r1, #0x83
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e6e202c
> -    ldr   r2, [r0]
> -    mov   r2, r2, lsr #12
> -    tst   r2, #0x01
> -    ldr   r0, =0x1e784000
> -    moveq r1, #0x0D                              @ Baudrate 115200
> -    movne r1, #0x01                              @ Baudrate 115200, div13
> -#ifdef CONFIG_DRAM_UART_38400
> -    moveq r1, #0x27                              @ Baudrate 38400
> -    movne r1, #0x03                              @ Baudrate 38400 , div13
> -#endif
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784004
> -    mov   r1, #0x00
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e78400c
> -    mov   r1, #0x03
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784008
> -    mov   r1, #0x07
> -    str   r1, [r0]
> +    bl    init_debug_uart
>
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x52                              @ 'R'
> -    str   r1, [r0]
> -    mov   r1, #0x41                              @ 'A'
> -    str   r1, [r0]
> -    mov   r1, #0x4D                              @ 'M'
> -    str   r1, [r0]
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x49                              @ 'I'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x74                              @ 't'
> -    str   r1, [r0]
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    mov   r1, #0x56                              @ 'V'
> -    str   r1, [r0]
> -    mov   r1, #ASTMMC_INIT_VER
> -    mov   r1, r1, lsr #4
> -    print_hex_char
> -    mov   r1, #ASTMMC_INIT_VER
> -    print_hex_char
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    ldr   r0, =0x1e784014
> -wait_print:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x52                              @ 'R'
> -    str   r1, [r0]
> +    mov   r0, #ASTMMC_INIT_VER
> +    bl    debug_print_dram_init_message
>  /* Debug - UART console message */
>
>  /***********************************************************
> *******************
> @@ -647,15 +585,8 @@ wait_print:
>   DDR3 Init
>   ************************************************************
> ******************/
>  ddr3_init:
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x33                              @ '3'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, #3
> +    bl    debug_print_ddr_version
>
>  #if   defined (CONFIG_DRAM_1333)
>      adrl  r5, TIME_TABLE_DDR3_1333               @ Init DRAM parameter
> table
> @@ -865,15 +796,8 @@ ddr3_check_dllrdy:
>   DDR4 Init
>   ************************************************************
> ******************/
>  ddr4_init:
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x34                              @ '4'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, #4
> +    bl    debug_print_ddr_version
>
>  #if   defined (CONFIG_DRAM_1333)
>      adrl  r5, TIME_TABLE_DDR4_1333               @ Init DRAM parameter
> table
> @@ -1439,18 +1363,8 @@ check_dram_size_end:
>      ldr   r1, =ASTMMC_INIT_DATE
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    str   r3, [r0]
> -    mov   r1, #0x47                              @ 'G'
> -    str   r1, [r0]
> -    mov   r1, #0x62                              @ 'b'
> -    str   r1, [r0]
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, r3
> +    bl    debug_print_dram_size
>
>      /* Enable DRAM Cache */
>      ldr   r0, =0x1e6e0004
> @@ -1520,26 +1434,8 @@ ddr_wait_engine_idle_1:
>      b     set_scratch                            @ CBRTest() return(1)
>
>  ddr_test_fail:
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x46                              @ 'F'
> -    str   r1, [r0]
> -    mov   r1, #0x61                              @ 'a'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x6C                              @ 'l'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -    ldr   r0, =0x1e784014
> -wait_print_0:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_0
> -/* Debug - UART console message */
> +    mov   r0, #0
> +    bl    debug_print_ddr_status
>      b     reset_mmc
>
>  set_scratch:
> @@ -1549,21 +1445,8 @@ set_scratch:
>      orr   r1, r1, #0x41
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x6F                              @ 'o'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x65                              @ 'e'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, #1
> +    bl    debug_print_ddr_status
>
>      /* Enable VGA display */
>      ldr   r0, =0x1e6e202c
> @@ -1571,184 +1454,10 @@ set_scratch:
>      bic   r1, r1, #0x40
>      str   r1, [r0]
>
> -/* Debug - UART console message */
> -   /* Print PHY timing information */
> -    ldr   r0, =0x1e784014
> -wait_print_1:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_1
> -
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x52                              @ 'R'
> -    str   r1, [r0]
> -    mov   r1, #0x65                              @ 'e'
> -    str   r1, [r0]
> -    mov   r1, #0x61                              @ 'a'
> -    str   r1, [r0]
> -    mov   r1, #0x64                              @ 'd'
> -    str   r1, [r0]
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x6D                              @ 'm'
> -    str   r1, [r0]
> -    mov   r1, #0x61                              @ 'a'
> -    str   r1, [r0]
> -    mov   r1, #0x72                              @ 'r'
> -    str   r1, [r0]
> -    mov   r1, #0x67                              @ 'g'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x2D                              @ '-'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x4C                              @ 'L'
> -    str   r1, [r0]
> -    mov   r1, #0x3A                              @ ':'
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784014
> -wait_print_2:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_2
> -
> -    ldr   r7, =0x000001FE                        @ divide by 510
> -    mov   r8, #10                                @ multiply by 10
> -print_DQL_eye_margin:
> -    ldr   r0, =0x1e6e03d0
> -    ldr   r2, [r0]
> -    and   r2, r2, #0xFF
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    mov   r1, #0x2E                              @ '.'
> -    str   r1, [r0]
> -    mov   r3, #0x4                               @ print 4 digits
> -print_DQL_div_loop:
> -    mul   r2, r8, r2
> -    cmp   r2, r7
> -    blt   print_DQL_div_0
> -    mov   r6, #0x0
> -print_DQL_div_digit:
> -    sub   r2, r2, r7
> -    add   r6, r6, #0x1
> -    cmp   r2, r7
> -    bge   print_DQL_div_digit
> -    b     print_DQL_div_n
> -
> -print_DQL_div_0:
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    b     print_DQL_next
> -print_DQL_div_n:
> -    add   r1, r6, #0x30                          @ print n
> -    str   r1, [r0]
> -print_DQL_next:
> -    subs  r3, r3, #1
> -    beq   print_DQH_eye_margin
> -    cmp   r2, #0x0
> -    beq   print_DQH_eye_margin
> -    b     print_DQL_div_loop
> -
> -print_DQH_eye_margin:
> -    mov   r1, #0x2F                              @ '/'
> -    str   r1, [r0]
> -    mov   r1, #0x44                              @ 'D'
> -    str   r1, [r0]
> -    mov   r1, #0x48                              @ 'H'
> -    str   r1, [r0]
> -    mov   r1, #0x3A                              @ ':'
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784014
> -wait_print_3:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_3
> -
>      ldr   r0, =0x1e6e03d0
>      ldr   r2, [r0]
> -    mov   r2, r2, lsr #8
> -    and   r2, r2, #0xFF
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    mov   r1, #0x2E                              @ '.'
> -    str   r1, [r0]
> -    mov   r3, #0x4                               @ print 4 digits
> -print_DQH_div_loop:
> -    mul   r2, r8, r2
> -    cmp   r2, r7
> -    blt   print_DQH_div_0
> -    mov   r6, #0x0
> -print_DQH_div_digit:
> -    sub   r2, r2, r7
> -    add   r6, r6, #0x1
> -    cmp   r2, r7
> -    bge   print_DQH_div_digit
> -    b     print_DQH_div_n
> -
> -print_DQH_div_0:
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    b     print_DQH_next
> -print_DQH_div_n:
> -    add   r1, r6, #0x30                          @ print n
> -    str   r1, [r0]
> -print_DQH_next:
> -    subs  r3, r3, #1
> -    beq   print_DQ_eye_margin_last
> -    cmp   r2, #0x0
> -    beq   print_DQ_eye_margin_last
> -    b     print_DQH_div_loop
> -
> -print_DQ_eye_margin_last:
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x43                              @ 'C'
> -    str   r1, [r0]
> -    mov   r1, #0x4B                              @ 'K'
> -    str   r1, [r0]
> -
> -    ldr   r0, =0x1e784014
> -wait_print_4:
> -    ldr   r1, [r0]
> -    tst   r1, #0x40
> -    beq   wait_print_4
> -
> -    ldr   r0, =0x1e784000
> -    mov   r1, #0x20                              @ ' '
> -    str   r1, [r0]
> -    mov   r1, #0x28                              @ '('
> -    str   r1, [r0]
> -    mov   r1, #0x6D                              @ 'm'
> -    str   r1, [r0]
> -    mov   r1, #0x69                              @ 'i'
> -    str   r1, [r0]
> -    mov   r1, #0x6E                              @ 'n'
> -    str   r1, [r0]
> -    mov   r1, #0x3A                              @ ':'
> -    str   r1, [r0]
> -    mov   r1, #0x30                              @ '0'
> -    str   r1, [r0]
> -    mov   r1, #0x2E                              @ '.'
> -    str   r1, [r0]
> -    mov   r1, #0x33                              @ '3'
> -    str   r1, [r0]
> -    mov   r1, #0x35                              @ '5'
> -    str   r1, [r0]
> -    mov   r1, #0x29                              @ ')'
> -    str   r1, [r0]
> -    mov   r1, #0x0D                              @ '\r'
> -    str   r1, [r0]
> -    mov   r1, #0x0A                              @ '\n'
> -    str   r1, [r0]
> -/* Debug - UART console message */
> +    mov   r0, r2
> +    bl    debug_print_ddr_phy_timing
>
>  platform_exit:
>  #ifdef CONFIG_DRAM_ECC
> @@ -1991,9 +1700,5 @@ set_D2PLL:
>      ldr   r1, =0xEA
>      str   r1, [r0]
>
> -    /* restore lr */
> -    mov   lr, r4
> -
>      /* back to arch calling code */
> -    mov   pc, lr
> -
> +    pop   {pc}
> --
> 2.8.0.rc3.226.g39d4020
>
>


-- 
*M*axim *S*loyko

--001a1142e87ed79f2e053bed9dce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+UGluZyE8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBGcmksIFNlcCAyLCAyMDE2IGF0IDEwOjU4IEFNLCAg
PHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86bWF4aW1zQGdvb2dsZS5jb20iIHRh
cmdldD0iX2JsYW5rIj5tYXhpbXNAZ29vZ2xlLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+RnJvbTogTWF4aW0g
U2xveWtvICZsdDs8YSBocmVmPSJtYWlsdG86bWF4aW1zQGdvb2dsZS5jb20iPm1heGltc0Bnb29n
bGUuY29tPC9hPiZndDs8YnI+DQo8YnI+DQpTZXQgdXAgYSBzdGFjayBpbiBTUkFNIGF0IHRoZSBi
ZWdpbm5pbmcgb2YgbG93bGV2ZWxfaW5pdCwgd2hpY2ggbWFrZXMgaXQ8YnI+DQpwb3NzaWJsZSB0
byBjYWxsIG5vbi10cml2aWFsIEMgZnVuY3Rpb25zLCBhcyB3ZWxsIGFzIHB1dCBkaWFnbm9zdGlj
PGJyPg0Kc3RyaW5ncyB0aGVtc2VsdmVzIG9udG8gdGhlIHN0YWNrLjxicj4NCjxicj4NClNldmVy
YWwgb25lLWNoYXIgd3JpdGVzIHRvIGRlYnVnIHVhcnQgc3RpbGwgcmVtYWluIGluIHBsYXRmb3Jt
LlMsIEk8YnI+DQpmaWd1cmVkIGl0JiMzOTtzIG5vdCB3b3J0aCBpdCB0byBtYWtlIGEgc2VwYXJh
dGUgY2FsbCB0byBjIGZ1bmN0aW9uIGZvciBlYWNoPGJyPg0Kb2YgdGhvc2UuPGJyPg0KLS0tPGJy
Pg0KwqBhcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL2FzdF91YXJ0LmggfCAx
NDIgKysrKysrKysrKys8YnI+DQrCoGFyY2gvYXJtL2luY2x1ZGUvYXNtL2FyY2gtPHdicj5hc3Bl
ZWQvcmVncy1zY3UuaCB8wqAgwqA0ICstPGJyPg0KwqBhcmNoL2FybS9tYWNoLWFzcGVlZC9NYWtl
ZmlsZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgYXJjaC9hcm0vbWFj
aC1hc3BlZWQvYXN0X3VhcnQuPHdicj5jwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMzggKysrPGJy
Pg0KwqBib2FyZC9hc3BlZWQvYXN0LWc1L2FzdC1nNS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fCAxMTAgKysrKysrKystPGJyPg0KwqBib2FyZC9hc3BlZWQvYXN0LWc1L3BsYXRmb3JtLlPCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8IDM1MSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPg0K
wqA2IGZpbGVzIGNoYW5nZWQsIDMxOCBpbnNlcnRpb25zKCspLCAzMjkgZGVsZXRpb25zKC0pPGJy
Pg0KwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJjaC08d2JyPmFz
cGVlZC9hc3RfdWFydC5oPGJyPg0KwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1h
c3BlZWQvYXN0X3VhcnQuPHdicj5jPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2FyY2gtPHdicj5hc3BlZWQvYXN0X3VhcnQuaCBiL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2FyY2gtPHdicj5hc3BlZWQvYXN0X3VhcnQuaDxicj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
PGJyPg0KaW5kZXggMDAwMDAwMC4uZGRmMWExNDxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysg
Yi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL2FzdF91YXJ0Lmg8YnI+DQpA
QCAtMCwwICsxLDE0MiBAQDxicj4NCisvKioqKioqKioqKioqKioqKioqKioqKioqKioqKjx3YnI+
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPHdicj4qKioqKioqKioqKioqKioqKioqKio8
YnI+DQorICogQ29weXJpZ2h0IChDKSAyMDE2IEdvb2dsZSBJbmM8YnI+DQorICo8YnI+DQorICog
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vcjxicj4NCisgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhczxicj4NCisgKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGU8YnI+DQorICogTGljZW5zZSwg
b3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi48YnI+DQorICo8YnI+DQorICog
VGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1
c2VmdWwsIGJ1dDxicj4NCisgKiBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRo
ZSBpbXBsaWVkIHdhcnJhbnR5IG9mPGJyPg0KKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gU2VlIHRoZSBHTlU8YnI+DQorICogR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLjxicj4NCisgKjxicj4NCisgKiBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZTxicj4NCisgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUg
RnJlZSBTb2Z0d2FyZTxicj4NCisgKiBGb3VuZGF0aW9uLCBJbmMuLCA1OSBUZW1wbGUgUGxhY2Us
IFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAwMjExMS0xMzA3PGJyPg0KKyAqIFVTQTxicj4NCisgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqPHdicj4qKioqKioqKioqKioqKioqKioqKioqKioq
KioqKio8d2JyPioqKioqKioqKioqKioqKioqKi88YnI+DQorPGJyPg0KKyNpZm5kZWYgX19BU1Rf
VUFSVF9IPGJyPg0KKyNkZWZpbmUgX19BU1RfVUFSVF9IPGJyPg0KKzxicj4NCisjaW5jbHVkZSAm
bHQ7YXNtL2lvLmgmZ3Q7PGJyPg0KKzxicj4NCisjZGVmaW5lIEFTVF9VQVJUX1JCUih1YXJ0KcKg
IMKgIMKgICh1YXJ0KTxicj4NCisjZGVmaW5lIEFTVF9VQVJUX1RIUih1YXJ0KcKgIMKgIMKgICh1
YXJ0KTxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0lFUih1YXJ0KcKgIMKgIMKgICgodWFydCkgKyAw
eDQpPGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfSUlSKHVhcnQpwqAgwqAgwqAgKCh1YXJ0KSArIDB4
OCk8YnI+DQorI2RlZmluZSBBU1RfVUFSVF9GQ1IodWFydCnCoCDCoCDCoCAoKHVhcnQpICsgMHg4
KTxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0xDUih1YXJ0KcKgIMKgIMKgICgodWFydCkgKyAweGMp
PGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfTUNSKHVhcnQpwqAgwqAgwqAgKCh1YXJ0KSArIDB4MTAp
PGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfTFNSKHVhcnQpwqAgwqAgwqAgKCh1YXJ0KSArIDB4MTQp
PGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfTVNSKHVhcnQpwqAgwqAgwqAgKCh1YXJ0KSArIDB4MTgp
PGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfU0NSKHVhcnQpwqAgwqAgwqAgKCh1YXJ0KSArIDB4MWMp
PGJyPg0KKzxicj4NCisvKiBUaGVzZSByZWdpc3RlcnMgY2FuIG9ubHkgYmUgd3JpdHRlbiB3aGVu
IERMQUIgPSAxKi88YnI+DQorI2RlZmluZSBBU1RfVUFSVF9ETEwodWFydCnCoCDCoCDCoCAoKHVh
cnQpKTxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0RMSCh1YXJ0KcKgIMKgIMKgICgodWFydCkgKyAw
eDQpPGJyPg0KKzxicj4NCisvKiBSZWdpc3RlcnMmIzM5OyBjb250ZW50cyAqLzxicj4NCis8YnI+
DQorI2RlZmluZSBBU1RfVUFSVF9JRVJfVEhSRcKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgNyk8YnI+
DQorI2RlZmluZSBBU1RfVUFSVF9JRVJfRURTU0nCoCDCoCDCoCAoMSAmbHQ7Jmx0OyAzKTxicj4N
CisjZGVmaW5lIEFTVF9VQVJUX0lFUl9FTFNJwqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyAyKTxicj4N
CisjZGVmaW5lIEFTVF9VQVJUX0lFUl9FVEJFScKgIMKgIMKgICgxICZsdDsmbHQ7IDEpPGJyPg0K
KyNkZWZpbmUgQVNUX1VBUlRfSUVSX0VSQkZJwqAgwqAgwqAgKDEgJmx0OyZsdDsgMCk8YnI+DQor
PGJyPg0KKy8qIEFORCB0aGlzIG1hc2sgd2l0aCBBU1RfVUFSVF9JSVIgdG8gZmluZCBvdXQgaWYg
RklGT3MgYXJlIGVuYWJsZWQuICovPGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfSUlSX0ZFTl9NQVNL
wqAgwqAoMyAmbHQ7Jmx0OyA2KTxicj4NCis8YnI+DQorLyogQml0MCA9PSAwIG1lYW5zIHRoYXQg
dGhlIGludGVycnVwdCBpcyBwZW5kaW5nLCBiaXRzIDM6MSBpZGVudGlmeTxicj4NCisgKiBpbnRl
cnJ1cHQuwqAgVGhlc2UgdmFsdWVzIGFyZSBkZWZpbmVkIHNvIHRoYXQgSUlSIHwgMHhmIHdvdWxk
IGdpdmUgeW91IHRoZTxicj4NCisgKiB2YWx1ZSBmb3IgdGhlIGludGVycnVwdC4gKi88YnI+DQor
I2RlZmluZSBBU1RfVUFSVF9JSVJfTVNDwqAgwqAgwqAgwqAgKDApPGJyPg0KKyNkZWZpbmUgQVNU
X1VBUlRfSUlSX1RIUkXCoCDCoCDCoCDCoCgxICZsdDsmbHQ7IDEpPGJyPg0KKyNkZWZpbmUgQVNU
X1VBUlRfSUlSX1JEQcKgIMKgIMKgIMKgICgyICZsdDsmbHQ7IDEpPGJyPg0KKyNkZWZpbmUgQVNU
X1VBUlRfSUlSX1JTwqAgwqAgwqAgwqAgwqAoMyAmbHQ7Jmx0OyAxKTxicj4NCisjZGVmaW5lIEFT
VF9VQVJUX0lJUl9DVE/CoCDCoCDCoCDCoCAoNiAmbHQ7Jmx0OyAxKTxicj4NCis8YnI+DQorLyog
UlggRklGTyBJbnRlcnJ1cHQgdHJpZ2dlciBsZXZlbCAqLzxicj4NCisjZGVmaW5lIEFTVF9VQVJU
X0ZDUl9SWEZJVExfTUFTS8KgIMKgICgzICZsdDsmbHQ7IDYpPGJyPg0KKy8qIE9uZSBieXRlIHJl
Y2VpdmVkICovPGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfRkNSX1JYRklUTDHCoCDCoCAoMCk8YnI+
DQorLyogNCBieXRlcyByZWNlaXZlZCAqLzxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0ZDUl9SWEZJ
VEw0wqAgwqAgKDEgJmx0OyZsdDsgNik8YnI+DQorLyogOCBieXRlcyByZWNlaXZlZCAqLzxicj4N
CisjZGVmaW5lIEFTVF9VQVJUX0ZDUl9SWEZJVEw4wqAgwqAgKDIgJmx0OyZsdDsgNik8YnI+DQor
LyogMTQgYnl0ZXMgcmVjZWl2ZWQgKi88YnI+DQorI2RlZmluZSBBU1RfVUFSVF9GQ1JfUlhGSVRM
MTTCoCDCoCgzICZsdDsmbHQ7IDYpPGJyPg0KKzxicj4NCisvKiBUWCBGSUZPIEludGVycnVwdCB0
cmlnZ2VyIGxldmVsICovPGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfRkNSX1RYRklUTF9NQVNLwqAg
wqAgKDMgJmx0OyZsdDsgNCk8YnI+DQorLyogRklGTyBFbXB0eSAoMCBieXRlcyBpbiBGSUZPKSAq
Lzxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0ZDUl9UWEZJVEwwwqAgwqAgKDApPGJyPg0KKy8qIDIg
Ynl0ZXMgaW4gRklGTyAqLzxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0ZDUl9UWEZJVEwywqAgwqAg
KDEgJmx0OyZsdDsgNCk8YnI+DQorLyogRklGTyAxLzQgZnVsbCAoNCBieXRlcykgKi88YnI+DQor
I2RlZmluZSBBU1RfVUFSVF9GQ1JfVFhGSVRMUcKgIMKgICgyICZsdDsmbHQ7IDQpPGJyPg0KKy8q
IEZJRk8gMS8yIGZ1bGwgKDggYnl0ZXMpICovPGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfRkNSX1RY
RklUTEjCoCDCoCAoMyAmbHQ7Jmx0OyA0KTxicj4NCis8YnI+DQorI2RlZmluZSBBU1RfVUFSVF9G
Q1JfVFhGUlNUwqAgwqAgwqAoMSAmbHQ7Jmx0OyAyKTxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0ZD
Ul9SWEZSU1TCoCDCoCDCoCgxICZsdDsmbHQ7IDEpPGJyPg0KKyNkZWZpbmUgQVNUX1VBUlRfRkNS
X0ZFTsKgIMKgIMKgIMKgICgxICZsdDsmbHQ7IDApPGJyPg0KKzxicj4NCisjZGVmaW5lIEFTVF9V
QVJUX0xDUl9ETEFCwqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyA3KTxicj4NCisjZGVmaW5lIEFTVF9V
QVJUX0xDUl9CQ8KgIMKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgNik8YnI+DQorI2RlZmluZSBBU1Rf
VUFSVF9MQ1JfRVBTwqAgwqAgwqAgwqAgKDEgJmx0OyZsdDsgNCk8YnI+DQorI2RlZmluZSBBU1Rf
VUFSVF9MQ1JfUEVOwqAgwqAgwqAgwqAgKDEgJmx0OyZsdDsgMyk8YnI+DQorI2RlZmluZSBBU1Rf
VUFSVF9MQ1JfU1RPUMKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgMik8YnI+DQorPGJyPg0KKy8qIE51
bWJlciBvZiBiaXRzIHBlciBjaGFyYWN0ZXIgKi88YnI+DQorI2RlZmluZSBBU1RfVUFSVF9MQ1Jf
QlBDX01BU0vCoCDCoCgzKTxicj4NCisjZGVmaW5lIEFTVF9VQVJUX0xDUl9CUEM1wqAgwqAgwqAg
wqAoMCk8YnI+DQorI2RlZmluZSBBU1RfVUFSVF9MQ1JfQlBDNsKgIMKgIMKgIMKgKDEpPGJyPg0K
KyNkZWZpbmUgQVNUX1VBUlRfTENSX0JQQzfCoCDCoCDCoCDCoCgyKTxicj4NCisjZGVmaW5lIEFT
VF9VQVJUX0xDUl9CUEM4wqAgwqAgwqAgwqAoMyk8YnI+DQorPGJyPg0KKyNkZWZpbmUgQVNUX1VB
UlRfTUNSX0xCwqAgwqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyA0KTxicj4NCisjZGVmaW5lIEFTVF9V
QVJUX01DUl9PVVQywqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyAzKTxicj4NCisjZGVmaW5lIEFTVF9V
QVJUX01DUl9PVVQxwqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyAyKTxicj4NCisjZGVmaW5lIEFTVF9V
QVJUX01DUl9SVFPCoCDCoCDCoCDCoCAoMSAmbHQ7Jmx0OyAxKTxicj4NCisjZGVmaW5lIEFTVF9V
QVJUX01DUl9EVFLCoCDCoCDCoCDCoCAoMSAmbHQ7Jmx0OyAwKTxicj4NCis8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9MU1JfRVJYRsKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgNyk8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9MU1JfVEVNUFRZwqAgwqAgwqAoMSAmbHQ7Jmx0OyA2KTxicj4NCisjZGVmaW5l
IEFTVF9VQVJUX0xTUl9USFJFwqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyA1KTxicj4NCisjZGVmaW5l
IEFTVF9VQVJUX0xTUl9CScKgIMKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgNCk8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9MU1JfRkXCoCDCoCDCoCDCoCDCoCgxICZsdDsmbHQ7IDMpPGJyPg0KKyNkZWZp
bmUgQVNUX1VBUlRfTFNSX1BFwqAgwqAgwqAgwqAgwqAoMSAmbHQ7Jmx0OyAyKTxicj4NCisjZGVm
aW5lIEFTVF9VQVJUX0xTUl9PRcKgIMKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgMSk8YnI+DQorI2Rl
ZmluZSBBU1RfVUFSVF9MU1JfRFLCoCDCoCDCoCDCoCDCoCgxICZsdDsmbHQ7IDApPGJyPg0KKzxi
cj4NCisjZGVmaW5lIEFTVF9VQVJUX01TUl9ORENEX09VVDLCoCAoMSAmbHQ7Jmx0OyA3KTxicj4N
CisjZGVmaW5lIEFTVF9VQVJUX01TUl9OUklfT1VUMcKgIMKgKDEgJmx0OyZsdDsgNik8YnI+DQor
I2RlZmluZSBBU1RfVUFSVF9NU1JfTkRTUl9ORFRSwqAgKDEgJmx0OyZsdDsgNSk8YnI+DQorI2Rl
ZmluZSBBU1RfVUFSVF9NU1JfTkNUU19OUlRTwqAgKDEgJmx0OyZsdDsgNCk8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9NU1JfRERDRMKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgMyk8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9NU1JfVEVSScKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgMik8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9NU1JfRERTUsKgIMKgIMKgIMKgKDEgJmx0OyZsdDsgMSk8YnI+DQorI2RlZmlu
ZSBBU1RfVUFSVF9NU1JfRENUU8KgIMKgIMKgIMKgKDEgJmx0OyZsdDsgMCk8YnI+DQorPGJyPg0K
KyNkZWZpbmUgQVNUX1VBUlRfRklGT19TSVpFwqAgwqAgwqAgKDE2KTxicj4NCis8YnI+DQorI2Rl
ZmluZSBhc3RfdWFydF93YWl0X3R4ZW1wdHkodWFydCkgd2hpbGUoIShyZWFkbChBU1RfVUFSVF9M
U1IoKDx3YnI+dWFydCkpKSAmYW1wOyBBU1RfVUFSVF9MU1JfVEVNUFRZKSk8YnI+DQorI2RlZmlu
ZSBhc3RfdWFydF93cml0ZSh1YXJ0LCBjKcKgIMKgIMKgd3JpdGVsKChjKSwgQVNUX1VBUlRfVEhS
KCh1YXJ0KSkpPGJyPg0KKyNkZWZpbmUgYXN0X3VhcnRfZW5hYmxlX2ZpZm8odWFydCnCoCBzZXRi
aXRzX2xlMzIoQVNUX1VBUlRfRkNSKCg8d2JyPnVhcnQpKSwgQVNUX1VBUlRfRkNSX0ZFTik8YnI+
DQorI2RlZmluZSBhc3RfdWFydF9lbmFibGVfdGhyZV9tb2RlKDx3YnI+dWFydCkgc2V0Yml0c19s
ZTMyKEFTVF9VQVJUX0lFUig8d2JyPnVhcnQpLCBBU1RfVUFSVF9JRVJfVEhSRSk8YnI+DQorPGJy
Pg0KKy8qIEluIFRIUkUgYW5kIEZJRk8gbW9kZSwgd2FpdCB1bnRpbCB0aGVyZSBpcyBzb21lIHNw
YWNlIGluIEZJRk8gKi88YnI+DQorI2RlZmluZSBhc3RfdWFydF93YWl0X2ZpZm9fcmVhZHkodWFy
dCkgd2hpbGUoKHJlYWRsKEFTVF9VQVJUX0xTUig8d2JyPnVhcnQpKSAmYW1wOyBBU1RfVUFSVF9M
U1JfVEhSRSkpPGJyPg0KKzxicj4NCisjZGVmaW5lIGFzdF91YXJ0X3NldF9icGModWFydCwgYnBj
KSBjbHJzZXRiaXRzX2xlMzIoQVNUX1VBUlRfTENSKCg8d2JyPnVhcnQpKSwgQVNUX1VBUlRfTENS
X0JQQ19NQVNLLCAoYnBjKSk8YnI+DQorPGJyPg0KKyNkZWZpbmUgYXN0X3VhcnRfdW5sb2NrX2Rs
YWIodWFydCkgc2V0Yml0c19sZTMyKEFTVF9VQVJUX0xDUigoPHdicj51YXJ0KSksIEFTVF9VQVJU
X0xDUl9ETEFCKTxicj4NCisjZGVmaW5lIGFzdF91YXJ0X2xvY2tfZGxhYih1YXJ0KSBjbHJiaXRz
X2xlMzIoQVNUX1VBUlRfTENSKDx3YnI+dWFydCksIEFTVF9VQVJUX0xDUl9ETEFCKTxicj4NCis8
YnI+DQorLyogTk9URTogVGhlc2Ugd3JpdGUgZnVuY3Rpb25zIG9ubHkgd29yayB3aGVuIFRIUkUg
bW9kZSBhbmQgRklGT3MgYXJlIGVuYWJsZWQuICovPGJyPg0KK3ZvaWQgYXN0X3VhcnRfd3JpdGVf
YnVmZmVyX3N5bmMoPHdicj51aW50MzJfdCB1YXJ0LCBjb25zdCB1aW50OF90KiBidWZmZXIsIHVp
bnQxNl90IGxlbik7PGJyPg0KK3ZvaWQgYXN0X3VhcnRfd3JpdGVfc3RyaW5nX3N5bmMoPHdicj51
aW50MzJfdCB1YXJ0LCBjb25zdCBjaGFyKiBzKTs8YnI+DQorPGJyPg0KKyNlbmRpZjxicj4NCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL3JlZ3Mtc2N1
LmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL3JlZ3Mtc2N1Lmg8YnI+
DQppbmRleCBiODlkZjgyLi5iNzE0ZmE5IDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2FyY2gtPHdicj5hc3BlZWQvcmVncy1zY3UuaDxicj4NCisrKyBiL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2FyY2gtPHdicj5hc3BlZWQvcmVncy1zY3UuaDxicj4NCkBAIC0xMCw4ICsxMCw4
IEBAPGJyPg0KwqAgKsKgIMKgIDEuIDIwMTIvMTIvMjkgUnlhbiBDaGVuIENyZWF0ZTxicj4NCsKg
ICo8YnI+DQrCoCoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjx3YnI+KioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqPHdicj4qKioqKioqKioqKioqKioqKioqKi88YnI+DQotI2lmbmRl
ZiBfX0FTVF9TQ1VfSDxicj4NCi0jZGVmaW5lIF9fQVNUX1NDVV9IwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAxPGJyPg0KKyNpZm5kZWYgX19BU1RfUkVHU19TQ1VfSDxicj4NCisjZGVm
aW5lIF9fQVNUX1JFR1NfU0NVX0jCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDE8YnI+
DQo8YnI+DQrCoCNpbmNsdWRlICZsdDthc20vYXJjaC9hc3BlZWQuaCZndDs8YnI+DQo8YnI+DQpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1hc3BlZWQvPHdicj5NYWtlZmlsZSBiL2FyY2gvYXJt
L21hY2gtYXNwZWVkLzx3YnI+TWFrZWZpbGU8YnI+DQppbmRleCBkNzJmNjJhLi4zZTBiNGY3IDEw
MDY0NDxicj4NCi0tLSBhL2FyY2gvYXJtL21hY2gtYXNwZWVkLzx3YnI+TWFrZWZpbGU8YnI+DQor
KysgYi9hcmNoL2FybS9tYWNoLWFzcGVlZC88d2JyPk1ha2VmaWxlPGJyPg0KQEAgLTExLDUgKzEx
LDUgQEA8YnI+DQrCoCM8YnI+DQo8YnI+DQo8YnI+DQotb2JqLXkgKz0gdGltZXIubyByZXNldC5v
IGNwdWluZm8ubyBhc3Qtc2N1Lm8gYXN0LWFoYmMubyBhc3Qtc2RtYy5vPGJyPg0KK29iai15ICs9
IHRpbWVyLm8gcmVzZXQubyBjcHVpbmZvLm8gYXN0LXNjdS5vIGFzdC1haGJjLm8gYXN0LXNkbWMu
byBhc3RfdWFydC5vPGJyPg0KwqBvYmotJChDT05GSUdfQVNUX1NQSV9OT1IpICs9IGZsYXNoLm88
YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1hc3BlZWQvYXN0Xzx3YnI+dWFydC5jIGIv
YXJjaC9hcm0vbWFjaC1hc3BlZWQvYXN0Xzx3YnI+dWFydC5jPGJyPg0KbmV3IGZpbGUgbW9kZSAx
MDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwLi4xMjI2ODI3PGJyPg0KLS0tIC9kZXYvbnVsbDxicj4N
CisrKyBiL2FyY2gvYXJtL21hY2gtYXNwZWVkL2FzdF88d2JyPnVhcnQuYzxicj4NCkBAIC0wLDAg
KzEsMzggQEA8YnI+DQorLyoqKioqKioqKioqKioqKioqKioqKioqKioqKio8d2JyPioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKjx3YnI+KioqKioqKioqKioqKioqKioqKioqPGJyPg0KKyAq
IENvcHlyaWdodCAoQykgMjAxNiBHb29nbGUgSW5jPGJyPg0KKyAqPGJyPg0KKyAqIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3I8YnI+
DQorICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYXM8YnI+DQorICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlPGJyPg0KKyAqIExpY2Vuc2UsIG9yIChhdCB5
b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uPGJyPg0KKyAqPGJyPg0KKyAqIFRoaXMgcHJv
Z3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLCBi
dXQ8YnI+DQorICogV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGll
ZCB3YXJyYW50eSBvZjxicj4NCisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuIFNlZSB0aGUgR05VPGJyPg0KKyAqIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgZm9yIG1vcmUgZGV0YWlscy48YnI+DQorICo8YnI+DQorICogWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2U8YnI+DQor
ICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29m
dHdhcmU8YnI+DQorICogRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAz
MzAsIEJvc3RvbiwgTUEgMDIxMTEtMTMwNzxicj4NCisgKiBVU0E8YnI+DQorICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKjx3YnI+KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPHdi
cj4qKioqKioqKioqKioqKioqKiovPGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7YXNtL2lvLmgm
Z3Q7PGJyPg0KKyNpbmNsdWRlICZsdDthc20vYXJjaC9hc3RfdWFydC5oJmd0Ozxicj4NCis8YnI+
DQordm9pZCBhc3RfdWFydF93cml0ZV9idWZmZXJfc3luYyg8d2JyPnVpbnQzMl90IHVhcnQsIGNv
bnN0IHVpbnQ4X3QgKmJ1ZmZlciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB1aW50MTZfdCBsZW4pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBm
b3IgKDsgbGVuOyAtLWxlbiwgKytidWZmZXIpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhc3RfdWFydF93YWl0X2ZpZm9fcmVhZHkodWFydCk8d2JyPjs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhc3RfdWFydF93cml0ZSh1YXJ0LCAqYnVmZmVyKTs8YnI+DQorwqAgwqAgwqAg
wqB9PGJyPg0KK308YnI+DQorPGJyPg0KK3ZvaWQgYXN0X3VhcnRfd3JpdGVfc3RyaW5nX3N5bmMo
PHdicj51aW50MzJfdCB1YXJ0LCBjb25zdCBjaGFyICpzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgZm9yICg7ICpzOyArK3MpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3RfdWFy
dF93YWl0X2ZpZm9fcmVhZHkodWFydCk8d2JyPjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhc3RfdWFydF93cml0ZSh1YXJ0LCAqcyk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9PGJy
Pg0KZGlmZiAtLWdpdCBhL2JvYXJkL2FzcGVlZC9hc3QtZzUvYXN0LWc1LmMgYi9ib2FyZC9hc3Bl
ZWQvYXN0LWc1L2FzdC1nNS5jPGJyPg0KaW5kZXggODFlYTg4YS4uYjBiODUzNSAxMDA2NDQ8YnI+
DQotLS0gYS9ib2FyZC9hc3BlZWQvYXN0LWc1L2FzdC1nNS5jPGJyPg0KKysrIGIvYm9hcmQvYXNw
ZWVkL2FzdC1nNS9hc3QtZzUuYzxicj4NCkBAIC0zNSwxNiArMzUsMjEgQEA8YnI+DQo8YnI+DQrC
oCNpbmNsdWRlICZsdDtjb21tb24uaCZndDs8YnI+DQrCoCNpbmNsdWRlICZsdDtuZXRkZXYuaCZn
dDs8YnI+DQotI2luY2x1ZGUgJmx0O2FzbS9hcmNoL2FzdF9zY3UuaCZndDs8YnI+DQorI2luY2x1
ZGUgJmx0O2FzbS9hcmNoL2FzdF9nNV9wbGF0Zm9ybS5oJmd0Ozxicj4NCsKgI2luY2x1ZGUgJmx0
O2FzbS9hcmNoL2FzdC1zZG1jLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDthc20vYXJjaC9hc3Rf
c2N1LmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDthc20vYXJjaC9hc3RfdWFydC5oJmd0Ozxicj4N
CisjaW5jbHVkZSAmbHQ7YXNtL2FyY2gvcmVncy1zY3UuaCZndDs8YnI+DQrCoCNpbmNsdWRlICZs
dDthc20vaW8uaCZndDs8YnI+DQo8YnI+DQorI2RlZmluZSBBU1RfREVCVUdfVUFSVMKgIMKgIMKg
ICgweDFlNzg0MDAwKTxicj4NCis8YnI+DQrCoERFQ0xBUkVfR0xPQkFMX0RBVEFfUFRSOzxicj4N
Cjxicj4NCsKgI2lmIGRlZmluZWQoQ09ORklHX1NIT1dfQk9PVF88d2JyPlBST0dSRVNTKTxicj4N
CsKgdm9pZCBzaG93X2Jvb3RfcHJvZ3Jlc3MoaW50IHByb2dyZXNzKTxicj4NCsKgezxicj4NCi3C
oCDCoCBwcmludGYoJnF1b3Q7Qm9vdCByZWFjaGVkIHN0YWdlICVkXG4mcXVvdDssIHByb2dyZXNz
KTs8YnI+DQorwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7Qm9vdCByZWFjaGVkIHN0YWdlICVkXG4m
cXVvdDssIHByb2dyZXNzKTs8YnI+DQrCoH08YnI+DQrCoCNlbmRpZjxicj4NCjxicj4NCkBAIC02
Niw5ICs3MSwxMDggQEAgaW50IGRyYW1faW5pdCh2b2lkKTxicj4NCsKgIMKgIMKgIMKgIHJldHVy
biAwOzxicj4NCsKgfTxicj4NCjxicj4NCisvKiBhc3N1bWVzIGRpZ2l0ICZsdDsgMTYgKi88YnI+
DQorc3RhdGljIGlubGluZSBjaGFyIGhleF9kaWdpdCh1aW50OF90IGRpZ2l0KTxicj4NCit7PGJy
Pg0KK8KgIMKgIMKgIMKgaWYgKGRpZ2l0ICZsdDsgMTApIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZXR1cm4gJiMzOTswJiMzOTsgKyBkaWdpdDs8YnI+DQorwqAgwqAgwqAgwqB9IGVs
c2Ugezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAmIzM5O2EmIzM5OyArIChk
aWdpdCAtIDEwKTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRp
YyBpbmxpbmUgdm9pZCBmb3JtYXRfdThfaGV4KGNoYXIgKmRzdCwgdWludDhfdCB2YWx1ZSk8YnI+
DQorezxicj4NCivCoCDCoCDCoCDCoCpkc3QgPSBoZXhfZGlnaXQodmFsdWUgJmd0OyZndDsgNCk7
PGJyPg0KK8KgIMKgIMKgIMKgKihkc3QgKyAxKSA9IGhleF9kaWdpdCh2YWx1ZSAmYW1wOyAweGYp
Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW5saW5lIHZvaWQgZGVidWdfdWFydF9wcmlu
dChjb25zdCBjaGFyICpzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgYXN0X3VhcnRfd3JpdGVf
c3RyaW5nX3N5bmMoPHdicj5BU1RfREVCVUdfVUFSVCwgcyk7PGJyPg0KK308YnI+DQorPGJyPg0K
K3ZvaWQgZGVidWdfcHJpbnRfZGRyX3ZlcnNpb24odWludDhfPHdicj50IHZlcnNpb24pPGJyPg0K
K3s8YnI+DQorwqAgwqAgwqAgwqBjaGFyIG1lc3NhZ2VbOF0gPSAmcXVvdDstRERSX1xyXG4mcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgbWVzc2FnZVs0XSA9ICYjMzk7MCYjMzk7ICsgdmVyc2lvbjs8
YnI+DQorwqAgwqAgwqAgwqBkZWJ1Z191YXJ0X3ByaW50KG1lc3NhZ2UpOzxicj4NCit9PGJyPg0K
Kzxicj4NCit2b2lkIGRlYnVnX3ByaW50X2RyYW1faW5pdF9tZXNzYWdlKDx3YnI+dWludDhfdCB2
ZXJzaW9uKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciBtZXNzYWdlWzE2XSA9ICZxdW90
O1xyXG5EUkFNIEluaXQtVl9fJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoGNoYXIgKnZlcnNpb25f
ZHN0ID0gbWVzc2FnZSArIDEzOzxicj4NCivCoCDCoCDCoCDCoGZvcm1hdF91OF9oZXgodmVyc2lv
bl9kc3QsIHZlcnNpb24pOzxicj4NCivCoCDCoCDCoCDCoGRlYnVnX3VhcnRfcHJpbnQobWVzc2Fn
ZSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3ZvaWQgZGVidWdfcHJpbnRfZHJhbV9zaXplKGNoYXIg
c2l6ZSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoGNoYXIgbWVzc2FnZVs2XSA9ICZxdW90Oy1f
R2ItJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoG1lc3NhZ2VbMV0gPSBzaXplOzxicj4NCivCoCDC
oCDCoCDCoGRlYnVnX3VhcnRfcHJpbnQobWVzc2FnZSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3Zv
aWQgZGVidWdfcHJpbnRfZGRyX3N0YXR1cyhib29sIGRvbmUpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqBpZiAoZG9uZSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRlYnVnX3VhcnRf
cHJpbnQoJnF1b3Q7RG9uZVxyXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoH0gZWxzZSB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVidWdfdWFydF9wcmludCgmcXVvdDtGYWlsXHJc
biZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMg
aW5saW5lIHZvaWQgZm9ybWF0X3BoeV90aW1pbmcoY2hhciAqZHN0LCB1aW50OF90IHZhbHVlKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgLyogVGhpcyBpcyBhZG9wdGVkIGZyb20gcGxhdGZvcm1z
LlMgZmlsZSBieSBBc3BlZWQuPGJyPg0KK8KgIMKgIMKgIMKgICogVGhleSByZWFkIG1lbW9yeSBh
ZGRyZXNzICh3aGljaCBpcyBub3QgbWVudGlvbmVkIGluIHRoZSBkYXRhIHNoZWV0KTxicj4NCivC
oCDCoCDCoCDCoCAqIGFuZCB0aGVuIGRpdmlkZSBieXRlIHZhbHVlIGJ5IDUxMCBhbmQgcHJpbnQg
NCBkaWdpdHMgYWZ0ZXIgdGhlIGRvdC48YnI+DQorwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAg
wqAgwqB1aW50MzJfdCB0aW1pbmdfdmFsdWUgPSB2YWx1ZSAqIDEwMDAgLyA1MTs8YnI+DQorwqAg
wqAgwqAgwqBmb3IgKGludCBpbmRleCA9IDM7IGluZGV4ICZndDs9IDAgJmFtcDsmYW1wOyB0aW1p
bmdfdmFsdWUgJmd0OyAwOyAtLWluZGV4KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dWludDhfdCBkaWdpdCA9IHRpbWluZ192YWx1ZSAlIDEwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHRpbWluZ192YWx1ZSAvPSAxMDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBk
c3RbaW5kZXhdID0gJiMzOTswJiMzOTsgKyBkaWdpdDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0K
K308YnI+DQorPGJyPg0KK3ZvaWQgZGVidWdfcHJpbnRfZGRyX3BoeV90aW1pbmcoPHdicj51aW50
MTZfdCBtYXJnaW4pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBjaGFyIG1lc3NhZ2VbNDZdID0g
JnF1b3Q7UmVhZCBtYXJnaW4gREw6MC4wMDAwLzAuMDAwMCBDSyAobWluOiAwLjM1KVxyXG4mcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgZm9ybWF0X3BoeV90aW1pbmcobWVzc2FnZSArIDE3LCBtYXJn
aW4gJmFtcDsgMHhmZik7PGJyPg0KK8KgIMKgIMKgIMKgZm9ybWF0X3BoeV90aW1pbmcobWVzc2Fn
ZSArIDI0LCAobWFyZ2luICZndDsmZ3Q7IDgpICZhbXA7IDB4ZmYpOzxicj4NCivCoCDCoCDCoCDC
oGRlYnVnX3VhcnRfcHJpbnQobWVzc2FnZSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2
b2lkIGluaXRfdWFydF9mb3JfZGVidWcodWludDMyX3QgdWFydF9iYXNlKTxicj4NCit7PGJyPg0K
K8KgIMKgIMKgIMKgYXN0X3VhcnRfc2V0X2JwYyh1YXJ0X2Jhc2UsIEFTVF9VQVJUX0xDUl9CUEM4
KTs8YnI+DQorwqAgwqAgwqAgwqBhc3RfdWFydF91bmxvY2tfZGxhYih1YXJ0Xzx3YnI+YmFzZSk7
PGJyPg0KK8KgIMKgIMKgIMKgY29uc3QgdWludDMyX3QgdWFydF9jbGtfbXVsID08YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqByZWFkbChBU1RfU0NVX0JBU0UgKyBBU1RfU0NVX01JU0MxX0NUUkwpICZh
bXA7ICgxICZsdDsmbHQ7IDEyKSA/IDEgOiAxMzs8YnI+DQorI2lmZGVmIENPTkZJR19EUkFNX1VB
UlRfMzg0MDA8YnI+DQorwqAgwqAgwqAgwqBjb25zdCB1aW50MzJfdCBicl9iYXNlID0gMyAqIHVh
cnRfY2xrX211bDs8YnI+DQorI2Vsc2U8YnI+DQorwqAgwqAgwqAgwqBjb25zdCB1aW50MzJfdCBi
cl9iYXNlID0gMSAqIHVhcnRfY2xrX211bDs8YnI+DQorI2VuZGlmPGJyPg0KK8KgIMKgIMKgIMKg
d3JpdGVsKGJyX2Jhc2UsIEFTVF9VQVJUX0RMTCh1YXJ0X2Jhc2UpKTs8YnI+DQorwqAgwqAgwqAg
wqB3cml0ZWwoMCwgQVNUX1VBUlRfRExIKHVhcnRfYmFzZSkpOzxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAvKiBMb2NrIERMQUIgKi88YnI+DQorwqAgwqAgwqAgwqBhc3RfdWFydF9sb2NrX2RsYWIo
dWFydF9iYXNlKTs8YnI+DQorwqAgwqAgwqAgwqBhc3RfdWFydF9lbmFibGVfZmlmbyh1YXJ0Xzx3
YnI+YmFzZSk7PGJyPg0KK8KgIMKgIMKgIMKgYXN0X3VhcnRfZW5hYmxlX3RocmVfbW9kZSg8d2Jy
PnVhcnRfYmFzZSk7PGJyPg0KK308YnI+DQorPGJyPg0KK3ZvaWQgaW5pdF9kZWJ1Z191YXJ0KHZv
aWQpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBpbml0X3VhcnRfZm9yX2RlYnVnKEFTVF9ERUJV
R188d2JyPlVBUlQpOzxicj4NCit9PGJyPg0KKzxicj4NCsKgI2lmZGVmIENPTkZJR19DTURfTkVU
PGJyPg0KwqBpbnQgYm9hcmRfZXRoX2luaXQoYmRfdCAqYmQpPGJyPg0KwqB7PGJyPg0KLcKgIMKg
IMKgIMKgIHJldHVybiBmdGdtYWMxMDBfaW5pdGlhbGl6ZShiZCk7PGJyPg0KK8KgIMKgIMKgIMKg
cmV0dXJuIGZ0Z21hYzEwMF9pbml0aWFsaXplKGJkKTs8YnI+DQrCoH08YnI+DQrCoCNlbmRpZjxi
cj4NCmRpZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvYXN0LWc1Lzx3YnI+cGxhdGZvcm0uUyBiL2Jv
YXJkL2FzcGVlZC9hc3QtZzUvPHdicj5wbGF0Zm9ybS5TPGJyPg0KaW5kZXggYzgxMGY0NC4uYTMz
YWZlZSAxMDA2NDQ8YnI+DQotLS0gYS9ib2FyZC9hc3BlZWQvYXN0LWc1Lzx3YnI+cGxhdGZvcm0u
Uzxicj4NCisrKyBiL2JvYXJkL2FzcGVlZC9hc3QtZzUvPHdicj5wbGF0Zm9ybS5TPGJyPg0KQEAg
LTc4LDcgKzc4LDYgQEA8YnI+DQrCoCNpbmNsdWRlICZsdDt2ZXJzaW9uLmgmZ3Q7PGJyPg0KPGJy
Pg0KwqAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8d2JyPioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKjx3YnI+KioqKioqKioqKioqKioqKioqKjxicj4NCi3CoCByNCA6IHJldHVy
biBwcm9ncmFtIGNvdW50ZXI8YnI+DQrCoCDCoHI1IDogRERSIHNwZWVkIHRpbWluZyB0YWJsZSBi
YXNlIGFkZHJlc3M8YnI+DQrCoCDCoEZyZWUgcmVnaXN0ZXJzOjxicj4NCsKgIMKgcjAsIHIxLCBy
MiwgcjMsIHI2LCByNywgcjgsIHI5LCByMTAsIHIxMTxicj4NCkBAIC0xMDQsNiArMTAzLDkgQEA8
YnI+DQrCoCNkZWZpbmUgQVNUTU1DX1JFR0lEWF9SRkPCoCDCoCAweDNDPGJyPg0KwqAjZGVmaW5l
IEFTVE1NQ19SRUdJRFhfUExMwqAgwqAgMHg0MDxicj4NCjxicj4NCisjZGVmaW5lIEFTVF9TUkFN
X0VORMKgIDB4MWU3MjhmZmM8YnI+DQorPGJyPg0KKzxicj4NCsKgVElNRV9UQUJMRV9ERFIzXzEz
MzM6PGJyPg0KwqAgwqAgwqAud29yZMKgIMKgMHg1MzUwM0MzN8KgIMKgIMKgIMKgQCAweDAxMDxi
cj4NCsKgIMKgIMKgLndvcmTCoCDCoDB4Rjg1OEQ0N0bCoCDCoCDCoCDCoEAgMHgwMTQ8YnI+DQpA
QCAtMjQyLDEyICsyNDQsMjAgQEAgVElNRV9UQUJMRV9ERFI0XzE2MDA6PGJyPg0KwqAgQ2FsaWJy
YXRpb24gTWFjcm8gRW5kPGJyPg0KwqAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPHdi
cj4qKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8d2JyPioqKioqKioqKioqKioqKioqKi88
YnI+DQo8YnI+DQorLmdsb2JsIGRlYnVnX3ByaW50X2RyYW1faW5pdF9tZXNzYWdlPGJyPg0KKy5n
bG9ibCBkZWJ1Z19wcmludF9kZHJfdmVyc2lvbjxicj4NCisuZ2xvYmwgZGVidWdfcHJpbnRfZHJh
bV9zaXplPGJyPg0KKy5nbG9ibCBkZWJ1Z19wcmludF9kZHJfc3RhdHVzPGJyPg0KKy5nbG9ibCBk
ZWJ1Z19wcmludF9kZHJfcGh5X3RpbWluZzxicj4NCisuZ2xvYmwgaW5pdF9kZWJ1Z191YXJ0PGJy
Pg0KwqAuZ2xvYmwgbG93bGV2ZWxfaW5pdDxicj4NCsKgbG93bGV2ZWxfaW5pdDo8YnI+DQo8YnI+
DQrCoGluaXRfZHJhbTo8YnI+DQorwqAgwqAgLyogU2V0dXAgYSBzdGFjayBpbiBTUkFNICovPGJy
Pg0KK8KgIMKgIGxkcsKgIMKgc3AsID1BU1RfU1JBTV9FTkQ8YnI+DQrCoCDCoCDCoC8qIHNhdmUg
bHIgKi88YnI+DQotwqAgwqAgbW92wqAgwqByNCwgbHI8YnI+DQorwqAgwqAgcHVzaMKgIHtscn08
YnI+DQo8YnI+DQrCoCDCoCDCoC8qIENsZWFyIEFIQiBidXMgbG9jayBjb25kaXRpb24gKi88YnI+
DQrCoCDCoCDCoGxkcsKgIMKgcjAsID0weDFlNjAwMDAwPGJyPg0KQEAgLTQ4OSw4MiArNDk5LDEw
IEBAIHdhaXRfbW1jX3Jlc2V0X2RvbmU6PGJyPg0KwqAgwqAgwqBsZHLCoCDCoHIxLCA9MHgwMDAy
MDAwMDxicj4NCsKgIMKgIMKgc3RywqAgwqByMSwgW3IwXTxicj4NCjxicj4NCi0vKiBEZWJ1ZyAt
IFVBUlQgY29uc29sZSBtZXNzYWdlICovPGJyPg0KLcKgIMKgIGxkcsKgIMKgcjAsID0weDFlNzg0
MDBjPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDgzPGJyPg0KLcKgIMKgIHN0csKgIMKgcjEs
IFtyMF08YnI+DQotPGJyPg0KLcKgIMKgIGxkcsKgIMKgcjAsID0weDFlNmUyMDJjPGJyPg0KLcKg
IMKgIGxkcsKgIMKgcjIsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMiwgcjIsIGxzciAjMTI8
YnI+DQotwqAgwqAgdHN0wqAgwqByMiwgIzB4MDE8YnI+DQotwqAgwqAgbGRywqAgwqByMCwgPTB4
MWU3ODQwMDA8YnI+DQotwqAgwqAgbW92ZXEgcjEsICMweDBEwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCBCYXVkcmF0ZSAxMTUyMDA8YnI+DQotwqAgwqAgbW92
bmUgcjEsICMweDAxwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
QCBCYXVkcmF0ZSAxMTUyMDAsIGRpdjEzPGJyPg0KLSNpZmRlZiBDT05GSUdfRFJBTV9VQVJUXzM4
NDAwPGJyPg0KLcKgIMKgIG1vdmVxIHIxLCAjMHgyN8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIEAgQmF1ZHJhdGUgMzg0MDA8YnI+DQotwqAgwqAgbW92bmUgcjEs
ICMweDAzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCBCYXVk
cmF0ZSAzODQwMCAsIGRpdjEzPGJyPg0KLSNlbmRpZjxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBb
cjBdPGJyPg0KLTxicj4NCi3CoCDCoCBsZHLCoCDCoHIwLCA9MHgxZTc4NDAwNDxicj4NCi3CoCDC
oCBtb3bCoCDCoHIxLCAjMHgwMDxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLTxi
cj4NCi3CoCDCoCBsZHLCoCDCoHIwLCA9MHgxZTc4NDAwYzxicj4NCi3CoCDCoCBtb3bCoCDCoHIx
LCAjMHgwMzxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLTxicj4NCi3CoCDCoCBs
ZHLCoCDCoHIwLCA9MHgxZTc4NDAwODxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAjMHgwNzxicj4N
Ci3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KK8KgIMKgIGJswqAgwqAgaW5pdF9kZWJ1Z191
YXJ0PGJyPg0KPGJyPg0KLcKgIMKgIGxkcsKgIMKgcjAsID0weDFlNzg0MDAwPGJyPg0KLcKgIMKg
IG1vdsKgIMKgcjEsICMweDBEwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgQCAmIzM5O1xyJiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3C
oCDCoCBtb3bCoCDCoHIxLCAjMHgwQcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIEAgJiMzOTtcbiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+
DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NDTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBAICYjMzk7RCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08
YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NTLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7UiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFty
MF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NDHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7QSYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEs
IFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NETCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7TSYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKg
cjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MjDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ICYjMzk7PGJyPg0KLcKgIMKgIHN0csKg
IMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NDnCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7SSYjMzk7PGJyPg0KLcKgIMKgIHN0
csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NkXCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7biYjMzk7PGJyPg0KLcKgIMKg
IHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NjnCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7aSYjMzk7PGJyPg0KLcKg
IMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NzTCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7dCYjMzk7PGJyPg0K
LcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MkTCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7LSYjMzk7PGJy
Pg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NTbC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ViYjMzk7
PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgI0FT
VE1NQ19JTklUX1ZFUjxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCByMSwgbHNyICM0PGJyPg0KLcKg
IMKgIHByaW50X2hleF9jaGFyPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICNBU1RNTUNfSU5JVF9W
RVI8YnI+DQotwqAgwqAgcHJpbnRfaGV4X2NoYXI8YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4
MkTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7LSYj
Mzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbGRywqAgwqByMCwg
PTB4MWU3ODQwMTQ8YnI+DQotd2FpdF9wcmludDo8YnI+DQotwqAgwqAgbGRywqAgwqByMSwgW3Iw
XTxicj4NCi3CoCDCoCB0c3TCoCDCoHIxLCAjMHg0MDxicj4NCi3CoCDCoCBiZXHCoCDCoHdhaXRf
cHJpbnQ8YnI+DQotwqAgwqAgbGRywqAgwqByMCwgPTB4MWU3ODQwMDA8YnI+DQotwqAgwqAgbW92
wqAgwqByMSwgIzB4NDTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBAICYjMzk7RCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAg
bW92wqAgwqByMSwgIzB4NDTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAICYjMzk7RCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAg
wqAgbW92wqAgwqByMSwgIzB4NTLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAICYjMzk7UiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQor
wqAgwqAgbW92wqAgwqByMCwgI0FTVE1NQ19JTklUX1ZFUjxicj4NCivCoCDCoCBibMKgIMKgIGRl
YnVnX3ByaW50X2RyYW1faW5pdF9tZXNzYWdlPGJyPg0KwqAvKiBEZWJ1ZyAtIFVBUlQgY29uc29s
ZSBtZXNzYWdlICovPGJyPg0KPGJyPg0KwqAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8
d2JyPioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjx3YnI+KioqKioqKioqKioqKioqKioq
Kjxicj4NCkBAIC02NDcsMTUgKzU4NSw4IEBAIHdhaXRfcHJpbnQ6PGJyPg0KwqAgRERSMyBJbml0
PGJyPg0KwqAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPHdicj4qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKio8d2JyPioqKioqKioqKioqKioqKioqKi88YnI+DQrCoGRkcjNfaW5p
dDo8YnI+DQotLyogRGVidWcgLSBVQVJUIGNvbnNvbGUgbWVzc2FnZSAqLzxicj4NCi3CoCDCoCBs
ZHLCoCDCoHIwLCA9MHgxZTc4NDAwMDxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAjMHgzM8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMzOTszJiMzOTs8YnI+
DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAjMHgwRMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMzOTtcciYjMzk7
PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4
MEHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7XG4m
IzM5Ozxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLS8qIERlYnVnIC0gVUFSVCBj
b25zb2xlIG1lc3NhZ2UgKi88YnI+DQorwqAgwqAgbW92wqAgwqByMCwgIzM8YnI+DQorwqAgwqAg
YmzCoCDCoCBkZWJ1Z19wcmludF9kZHJfdmVyc2lvbjxicj4NCjxicj4NCsKgI2lmwqAgwqBkZWZp
bmVkIChDT05GSUdfRFJBTV8xMzMzKTxicj4NCsKgIMKgIMKgYWRybMKgIHI1LCBUSU1FX1RBQkxF
X0REUjNfMTMzM8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCBJbml0IERSQU0gcGFyYW1ldGVyIHRh
YmxlPGJyPg0KQEAgLTg2NSwxNSArNzk2LDggQEAgZGRyM19jaGVja19kbGxyZHk6PGJyPg0KwqAg
RERSNCBJbml0PGJyPg0KwqAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPHdicj4qKioq
KioqKioqKioqKioqKioqKioqKioqKioqKio8d2JyPioqKioqKioqKioqKioqKioqKi88YnI+DQrC
oGRkcjRfaW5pdDo8YnI+DQotLyogRGVidWcgLSBVQVJUIGNvbnNvbGUgbWVzc2FnZSAqLzxicj4N
Ci3CoCDCoCBsZHLCoCDCoHIwLCA9MHgxZTc4NDAwMDxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAj
MHgzNMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMzOTs0
JiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIx
LCAjMHgwRMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMz
OTtcciYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAg
wqByMSwgIzB4MEHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
ICYjMzk7XG4mIzM5Ozxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLS8qIERlYnVn
IC0gVUFSVCBjb25zb2xlIG1lc3NhZ2UgKi88YnI+DQorwqAgwqAgbW92wqAgwqByMCwgIzQ8YnI+
DQorwqAgwqAgYmzCoCDCoCBkZWJ1Z19wcmludF9kZHJfdmVyc2lvbjxicj4NCjxicj4NCsKgI2lm
wqAgwqBkZWZpbmVkIChDT05GSUdfRFJBTV8xMzMzKTxicj4NCsKgIMKgIMKgYWRybMKgIHI1LCBU
SU1FX1RBQkxFX0REUjRfMTMzM8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCBJbml0IERSQU0gcGFy
YW1ldGVyIHRhYmxlPGJyPg0KQEAgLTE0MzksMTggKzEzNjMsOCBAQCBjaGVja19kcmFtX3NpemVf
ZW5kOjxicj4NCsKgIMKgIMKgbGRywqAgwqByMSwgPUFTVE1NQ19JTklUX0RBVEU8YnI+DQrCoCDC
oCDCoHN0csKgIMKgcjEsIFtyMF08YnI+DQo8YnI+DQotLyogRGVidWcgLSBVQVJUIGNvbnNvbGUg
bWVzc2FnZSAqLzxicj4NCi3CoCDCoCBsZHLCoCDCoHIwLCA9MHgxZTc4NDAwMDxicj4NCi3CoCDC
oCBtb3bCoCDCoHIxLCAjMHgyRMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIEAgJiMzOTstJiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3C
oCDCoCBzdHLCoCDCoHIzLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDQ3wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O0cmIzM5Ozxicj4N
Ci3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDYywqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O2ImIzM5Ozxi
cj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDJE
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5Oy0mIzM5
Ozxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLS8qIERlYnVnIC0gVUFSVCBjb25z
b2xlIG1lc3NhZ2UgKi88YnI+DQorwqAgwqAgbW92wqAgwqByMCwgcjM8YnI+DQorwqAgwqAgYmzC
oCDCoCBkZWJ1Z19wcmludF9kcmFtX3NpemU8YnI+DQo8YnI+DQrCoCDCoCDCoC8qIEVuYWJsZSBE
UkFNIENhY2hlICovPGJyPg0KwqAgwqAgwqBsZHLCoCDCoHIwLCA9MHgxZTZlMDAwNDxicj4NCkBA
IC0xNTIwLDI2ICsxNDM0LDggQEAgZGRyX3dhaXRfZW5naW5lX2lkbGVfMTo8YnI+DQrCoCDCoCDC
oGLCoCDCoCDCoHNldF9zY3JhdGNowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgQCBDQlJUZXN0KCkgcmV0dXJuKDEpPGJyPg0KPGJyPg0KwqBkZHJfdGVzdF9mYWlsOjxi
cj4NCi0vKiBEZWJ1ZyAtIFVBUlQgY29uc29sZSBtZXNzYWdlICovPGJyPg0KLcKgIMKgIGxkcsKg
IMKgcjAsID0weDFlNzg0MDAwPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDQ2wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O0YmIzM5Ozxicj4NCi3C
oCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDYxwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O2EmIzM5Ozxicj4N
Ci3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDY5wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O2kmIzM5Ozxi
cj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDZD
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O2wmIzM5
Ozxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMw
eDBEwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O1xy
JiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIx
LCAjMHgwQcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMz
OTtcbiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbGRywqAg
wqByMCwgPTB4MWU3ODQwMTQ8YnI+DQotd2FpdF9wcmludF8wOjxicj4NCi3CoCDCoCBsZHLCoCDC
oHIxLCBbcjBdPGJyPg0KLcKgIMKgIHRzdMKgIMKgcjEsICMweDQwPGJyPg0KLcKgIMKgIGJlccKg
IMKgd2FpdF9wcmludF8wPGJyPg0KLS8qIERlYnVnIC0gVUFSVCBjb25zb2xlIG1lc3NhZ2UgKi88
YnI+DQorwqAgwqAgbW92wqAgwqByMCwgIzA8YnI+DQorwqAgwqAgYmzCoCDCoCBkZWJ1Z19wcmlu
dF9kZHJfc3RhdHVzPGJyPg0KwqAgwqAgwqBiwqAgwqAgwqByZXNldF9tbWM8YnI+DQo8YnI+DQrC
oHNldF9zY3JhdGNoOjxicj4NCkBAIC0xNTQ5LDIxICsxNDQ1LDggQEAgc2V0X3NjcmF0Y2g6PGJy
Pg0KwqAgwqAgwqBvcnLCoCDCoHIxLCByMSwgIzB4NDE8YnI+DQrCoCDCoCDCoHN0csKgIMKgcjEs
IFtyMF08YnI+DQo8YnI+DQotLyogRGVidWcgLSBVQVJUIGNvbnNvbGUgbWVzc2FnZSAqLzxicj4N
Ci3CoCDCoCBsZHLCoCDCoHIwLCA9MHgxZTc4NDAwMDxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAj
MHg0NMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMzOTtE
JiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIx
LCAjMHg2RsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMz
OTtvJiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDC
oHIxLCAjMHg2RcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAg
JiMzOTtuJiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bC
oCDCoHIxLCAjMHg2NcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IEAgJiMzOTtlJiMzOTs8YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBt
b3bCoCDCoHIxLCAjMHgwRMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIEAgJiMzOTtcciYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAg
wqAgbW92wqAgwqByMSwgIzB4MEHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAICYjMzk7XG4mIzM5Ozxicj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0K
LS8qIERlYnVnIC0gVUFSVCBjb25zb2xlIG1lc3NhZ2UgKi88YnI+DQorwqAgwqAgbW92wqAgwqBy
MCwgIzE8YnI+DQorwqAgwqAgYmzCoCDCoCBkZWJ1Z19wcmludF9kZHJfc3RhdHVzPGJyPg0KPGJy
Pg0KwqAgwqAgwqAvKiBFbmFibGUgVkdBIGRpc3BsYXkgKi88YnI+DQrCoCDCoCDCoGxkcsKgIMKg
cjAsID0weDFlNmUyMDJjPGJyPg0KQEAgLTE1NzEsMTg0ICsxNDU0LDEwIEBAIHNldF9zY3JhdGNo
Ojxicj4NCsKgIMKgIMKgYmljwqAgwqByMSwgcjEsICMweDQwPGJyPg0KwqAgwqAgwqBzdHLCoCDC
oHIxLCBbcjBdPGJyPg0KPGJyPg0KLS8qIERlYnVnIC0gVUFSVCBjb25zb2xlIG1lc3NhZ2UgKi88
YnI+DQotwqAgwqAvKiBQcmludCBQSFkgdGltaW5nIGluZm9ybWF0aW9uICovPGJyPg0KLcKgIMKg
IGxkcsKgIMKgcjAsID0weDFlNzg0MDE0PGJyPg0KLXdhaXRfcHJpbnRfMTo8YnI+DQotwqAgwqAg
bGRywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCB0c3TCoCDCoHIxLCAjMHg0MDxicj4NCi3CoCDC
oCBiZXHCoCDCoHdhaXRfcHJpbnRfMTxicj4NCi08YnI+DQotwqAgwqAgbGRywqAgwqByMCwgPTB4
MWU3ODQwMDA8YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NTLCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7UiYjMzk7PGJyPg0KLcKgIMKgIHN0csKg
IMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NjXCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ZSYjMzk7PGJyPg0KLcKgIMKgIHN0
csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NjHCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7YSYjMzk7PGJyPg0KLcKgIMKg
IHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NjTCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ZCYjMzk7PGJyPg0KLcKg
IMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MjDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ICYjMzk7PGJyPg0K
LcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NkTCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7bSYjMzk7PGJy
Pg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NjHC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7YSYjMzk7
PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4
NzLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ciYj
Mzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwg
IzB4NjfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7
ZyYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqBy
MSwgIzB4NjnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYj
Mzk7aSYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAg
wqByMSwgIzB4NkXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
ICYjMzk7biYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92
wqAgwqByMSwgIzB4MkTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBAICYjMzk7LSYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAg
bW92wqAgwqByMSwgIzB4NDTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAICYjMzk7RCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAg
wqAgbW92wqAgwqByMSwgIzB4NEPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAICYjMzk7TCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQot
wqAgwqAgbW92wqAgwqByMSwgIzB4M0HCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBAICYjMzk7OiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+
DQotPGJyPg0KLcKgIMKgIGxkcsKgIMKgcjAsID0weDFlNzg0MDE0PGJyPg0KLXdhaXRfcHJpbnRf
Mjo8YnI+DQotwqAgwqAgbGRywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCB0c3TCoCDCoHIxLCAj
MHg0MDxicj4NCi3CoCDCoCBiZXHCoCDCoHdhaXRfcHJpbnRfMjxicj4NCi08YnI+DQotwqAgwqAg
bGRywqAgwqByNywgPTB4MDAwMDAxRkXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBAIGRpdmlkZSBieSA1MTA8YnI+DQotwqAgwqAgbW92wqAgwqByOCwgIzEwwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCBtdWx0aXBseSBieSAxMDxicj4N
Ci1wcmludF9EUUxfZXllX21hcmdpbjo8YnI+DQotwqAgwqAgbGRywqAgwqByMCwgPTB4MWU2ZTAz
ZDA8YnI+DQotwqAgwqAgbGRywqAgwqByMiwgW3IwXTxicj4NCi3CoCDCoCBhbmTCoCDCoHIyLCBy
MiwgIzB4RkY8YnI+DQotwqAgwqAgbGRywqAgwqByMCwgPTB4MWU3ODQwMDA8YnI+DQotwqAgwqAg
bW92wqAgwqByMSwgIzB4MzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAICYjMzk7MCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAg
wqAgbW92wqAgwqByMSwgIzB4MkXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAICYjMzk7LiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQot
wqAgwqAgbW92wqAgwqByMywgIzB4NMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgQCBwcmludCA0IGRpZ2l0czxicj4NCi1wcmludF9EUUxfZGl2X2xvb3A6PGJy
Pg0KLcKgIMKgIG11bMKgIMKgcjIsIHI4LCByMjxicj4NCi3CoCDCoCBjbXDCoCDCoHIyLCByNzxi
cj4NCi3CoCDCoCBibHTCoCDCoHByaW50X0RRTF9kaXZfMDxicj4NCi3CoCDCoCBtb3bCoCDCoHI2
LCAjMHgwPGJyPg0KLXByaW50X0RRTF9kaXZfZGlnaXQ6PGJyPg0KLcKgIMKgIHN1YsKgIMKgcjIs
IHIyLCByNzxicj4NCi3CoCDCoCBhZGTCoCDCoHI2LCByNiwgIzB4MTxicj4NCi3CoCDCoCBjbXDC
oCDCoHIyLCByNzxicj4NCi3CoCDCoCBiZ2XCoCDCoHByaW50X0RRTF9kaXZfZGlnaXQ8YnI+DQot
wqAgwqAgYsKgIMKgIMKgcHJpbnRfRFFMX2Rpdl9uPGJyPg0KLTxicj4NCi1wcmludF9EUUxfZGl2
XzA6PGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDMwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5OzAmIzM5Ozxicj4NCi3CoCDCoCBzdHLCoCDCoHIx
LCBbcjBdPGJyPg0KLcKgIMKgIGLCoCDCoCDCoHByaW50X0RRTF9uZXh0PGJyPg0KLXByaW50X0RR
TF9kaXZfbjo8YnI+DQotwqAgwqAgYWRkwqAgwqByMSwgcjYsICMweDMwwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCBwcmludCBuPGJyPg0KLcKgIMKgIHN0csKgIMKgcjEs
IFtyMF08YnI+DQotcHJpbnRfRFFMX25leHQ6PGJyPg0KLcKgIMKgIHN1YnPCoCByMywgcjMsICMx
PGJyPg0KLcKgIMKgIGJlccKgIMKgcHJpbnRfRFFIX2V5ZV9tYXJnaW48YnI+DQotwqAgwqAgY21w
wqAgwqByMiwgIzB4MDxicj4NCi3CoCDCoCBiZXHCoCDCoHByaW50X0RRSF9leWVfbWFyZ2luPGJy
Pg0KLcKgIMKgIGLCoCDCoCDCoHByaW50X0RRTF9kaXZfbG9vcDxicj4NCi08YnI+DQotcHJpbnRf
RFFIX2V5ZV9tYXJnaW46PGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDJGwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5Oy8mIzM5Ozxicj4NCi3CoCDC
oCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDQ0wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O0QmIzM5Ozxicj4NCi3C
oCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDQ4wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O0gmIzM5Ozxicj4N
Ci3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDNBwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5OzomIzM5Ozxi
cj4NCi3CoCDCoCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLTxicj4NCi3CoCDCoCBsZHLCoCDCoHIw
LCA9MHgxZTc4NDAxNDxicj4NCi13YWl0X3ByaW50XzM6PGJyPg0KLcKgIMKgIGxkcsKgIMKgcjEs
IFtyMF08YnI+DQotwqAgwqAgdHN0wqAgwqByMSwgIzB4NDA8YnI+DQotwqAgwqAgYmVxwqAgwqB3
YWl0X3ByaW50XzM8YnI+DQotPGJyPg0KwqAgwqAgwqBsZHLCoCDCoHIwLCA9MHgxZTZlMDNkMDxi
cj4NCsKgIMKgIMKgbGRywqAgwqByMiwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIyLCByMiwg
bHNyICM4PGJyPg0KLcKgIMKgIGFuZMKgIMKgcjIsIHIyLCAjMHhGRjxicj4NCi3CoCDCoCBsZHLC
oCDCoHIwLCA9MHgxZTc4NDAwMDxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAjMHgzMMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMzOTswJiMzOTs8YnI+DQot
wqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIxLCAjMHgyRcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAgJiMzOTsuJiMzOTs8YnI+
DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi3CoCDCoCBtb3bCoCDCoHIzLCAjMHg0wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBAIHByaW50IDQgZGln
aXRzPGJyPg0KLXByaW50X0RRSF9kaXZfbG9vcDo8YnI+DQotwqAgwqAgbXVswqAgwqByMiwgcjgs
IHIyPGJyPg0KLcKgIMKgIGNtcMKgIMKgcjIsIHI3PGJyPg0KLcKgIMKgIGJsdMKgIMKgcHJpbnRf
RFFIX2Rpdl8wPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjYsICMweDA8YnI+DQotcHJpbnRfRFFIX2Rp
dl9kaWdpdDo8YnI+DQotwqAgwqAgc3ViwqAgwqByMiwgcjIsIHI3PGJyPg0KLcKgIMKgIGFkZMKg
IMKgcjYsIHI2LCAjMHgxPGJyPg0KLcKgIMKgIGNtcMKgIMKgcjIsIHI3PGJyPg0KLcKgIMKgIGJn
ZcKgIMKgcHJpbnRfRFFIX2Rpdl9kaWdpdDxicj4NCi3CoCDCoCBiwqAgwqAgwqBwcmludF9EUUhf
ZGl2X248YnI+DQotPGJyPg0KLXByaW50X0RRSF9kaXZfMDo8YnI+DQotwqAgwqAgbW92wqAgwqBy
MSwgIzB4MzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYj
Mzk7MCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgYsKgIMKg
IMKgcHJpbnRfRFFIX25leHQ8YnI+DQotcHJpbnRfRFFIX2Rpdl9uOjxicj4NCi3CoCDCoCBhZGTC
oCDCoHIxLCByNiwgIzB4MzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
IHByaW50IG48YnI+DQotwqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi1wcmludF9EUUhfbmV4
dDo8YnI+DQotwqAgwqAgc3Vic8KgIHIzLCByMywgIzE8YnI+DQotwqAgwqAgYmVxwqAgwqBwcmlu
dF9EUV9leWVfbWFyZ2luX2xhc3Q8YnI+DQotwqAgwqAgY21wwqAgwqByMiwgIzB4MDxicj4NCi3C
oCDCoCBiZXHCoCDCoHByaW50X0RRX2V5ZV9tYXJnaW5fbGFzdDxicj4NCi3CoCDCoCBiwqAgwqAg
wqBwcmludF9EUUhfZGl2X2xvb3A8YnI+DQotPGJyPg0KLXByaW50X0RRX2V5ZV9tYXJnaW5fbGFz
dDo8YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MjDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7ICYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEs
IFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NDPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7QyYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKg
cjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4NELCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7SyYjMzk7PGJyPg0KLcKgIMKgIHN0csKg
IMKgcjEsIFtyMF08YnI+DQotPGJyPg0KLcKgIMKgIGxkcsKgIMKgcjAsID0weDFlNzg0MDE0PGJy
Pg0KLXdhaXRfcHJpbnRfNDo8YnI+DQotwqAgwqAgbGRywqAgwqByMSwgW3IwXTxicj4NCi3CoCDC
oCB0c3TCoCDCoHIxLCAjMHg0MDxicj4NCi3CoCDCoCBiZXHCoCDCoHdhaXRfcHJpbnRfNDxicj4N
Ci08YnI+DQotwqAgwqAgbGRywqAgwqByMCwgPTB4MWU3ODQwMDA8YnI+DQotwqAgwqAgbW92wqAg
wqByMSwgIzB4MjDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
ICYjMzk7ICYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92
wqAgwqByMSwgIzB4MjjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBAICYjMzk7KCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAg
bW92wqAgwqByMSwgIzB4NkTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAICYjMzk7bSYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQotwqAg
wqAgbW92wqAgwqByMSwgIzB4NjnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAICYjMzk7aSYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+DQot
wqAgwqAgbW92wqAgwqByMSwgIzB4NkXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBAICYjMzk7biYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08YnI+
DQotwqAgwqAgbW92wqAgwqByMSwgIzB4M0HCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBAICYjMzk7OiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFtyMF08
YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7MCYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEsIFty
MF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MkXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7LiYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKgcjEs
IFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MzPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7MyYjMzk7PGJyPg0KLcKgIMKgIHN0csKgIMKg
cjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MzXCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7NSYjMzk7PGJyPg0KLcKgIMKgIHN0csKg
IMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4MjnCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7KSYjMzk7PGJyPg0KLcKgIMKgIHN0
csKgIMKgcjEsIFtyMF08YnI+DQotwqAgwqAgbW92wqAgwqByMSwgIzB4METCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAICYjMzk7XHImIzM5Ozxicj4NCi3CoCDC
oCBzdHLCoCDCoHIxLCBbcjBdPGJyPg0KLcKgIMKgIG1vdsKgIMKgcjEsICMweDBBwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCAmIzM5O1xuJiMzOTs8YnI+DQot
wqAgwqAgc3RywqAgwqByMSwgW3IwXTxicj4NCi0vKiBEZWJ1ZyAtIFVBUlQgY29uc29sZSBtZXNz
YWdlICovPGJyPg0KK8KgIMKgIG1vdsKgIMKgcjAsIHIyPGJyPg0KK8KgIMKgIGJswqAgwqAgZGVi
dWdfcHJpbnRfZGRyX3BoeV90aW1pbmc8YnI+DQo8YnI+DQrCoHBsYXRmb3JtX2V4aXQ6PGJyPg0K
wqAjaWZkZWYgQ09ORklHX0RSQU1fRUNDPGJyPg0KQEAgLTE5OTEsOSArMTcwMCw1IEBAIHNldF9E
MlBMTDo8YnI+DQrCoCDCoCDCoGxkcsKgIMKgcjEsID0weEVBPGJyPg0KwqAgwqAgwqBzdHLCoCDC
oHIxLCBbcjBdPGJyPg0KPGJyPg0KLcKgIMKgIC8qIHJlc3RvcmUgbHIgKi88YnI+DQotwqAgwqAg
bW92wqAgwqBsciwgcjQ8YnI+DQotPGJyPg0KwqAgwqAgwqAvKiBiYWNrIHRvIGFyY2ggY2FsbGlu
ZyBjb2RlICovPGJyPg0KLcKgIMKgIG1vdsKgIMKgcGMsIGxyPGJyPg0KLTxicj4NCivCoCDCoCBw
b3DCoCDCoHtwY308YnI+DQo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xvcj0iIzg4ODg4
OCI+LS08YnI+DQoyLjguMC5yYzMuMjI2LmczOWQ0MDIwPGJyPg0KPGJyPg0KPC9mb250Pjwvc3Bh
bj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjxiciBjbGVhcj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4t
LSA8YnI+PGRpdiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIiBkYXRhLXNtYXJ0bWFpbD0iZ21haWxf
c2lnbmF0dXJlIj48ZGl2PjxiPk08L2I+YXhpbSA8Yj5TPC9iPmxveWtvPC9kaXY+PC9kaXY+DQo8
L2Rpdj4NCg==
--001a1142e87ed79f2e053bed9dce--
