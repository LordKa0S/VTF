-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2019 at 04:46 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keys`
--

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `name` varchar(20) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `aadhar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`name`, `voter_id`, `aadhar`) VALUES
('kartik', 11111, 11111),
('sparsh', 22222, 22222),
('kaustubh', 33333, 33333);

-- --------------------------------------------------------

--
-- Table structure for table `pub`
--

CREATE TABLE `pub` (
  `id` int(11) NOT NULL,
  `pubkey` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pub`
--

INSERT INTO `pub` (`id`, `pubkey`) VALUES
(1, '-----BEGIN PRIVATE KEY-----\nMIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAJmqlTsfoPMgwWMp\nCp0Ddk/TjCHa19yM3Qa8sqLcLhdkTY6A+J2+y6XAy/zGUEa6DW8+d8pnDckAcGUA\nlu2iTMACJgFpSI4COU51i5NfucPqIPZHYtfgwf42E0mfyg+DpvGXUoSAfd/yDWEp\nA1J2da6JJS+Zm/5A10seJdcXiMf3AgMBAAECgYBSaslrUoVyoSjX1FVa7VZxbhcE\nuWl5YxvQ1zhAXTNjXGq0ebveb0yuc/90bbD0nilCdxCswCUGn3Oo2G4auifLJxeY\nnhvLyuwYt2LGtf3+GyccdULHZmQA88FgL0WSQJy4RE7dDTGMinjJs1SxbShfQnwr\nOuBwew85jWsY6a3NEQJBAMgv2fR4mbV5pKaMCEDigreZmc+9zwk5/jwwb9WEOnkS\nlCPHaMN1gXybmWJIY8MxQcyPqJH3e/otTI2ntqGvJuMCQQDEgl61NMvjWU9E6jQN\nkyhAda5Eo7u8G4fWGEArvJQxBu+Zvf4YjCLiEa+u2nooWfcM72NZiS/+2ucuWxfC\nOtLdAkAVb9pdLZT4NACHvTMdD6SD2LT55A+Jo2YwN9eh+7jvQigO9MmpNKobF+aC\n+dGFE39CUpfwmZnzHmq2OKF8Cu+VAkBPAMrqtysxX/qKjk4XFw6bu7QwTFNxsO/P\nlzhVXR+HBm7VtJivbceoc8vZ1GRATMsSHDwpBwqQv5kp/d1zbQrRAkBaORJlUlhT\nE6ySkVG4AF3ARAHw9h6FHj2b4jfBrjfHl92/DatZFzgh01woK/nTP88ONFJ8bNKu\nIOtslRRbQcS4\n-----END PRIVATE KEY-----\n'),
(2, '-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAPMrEmEj4gjHWQzs\nlLtg7MVS4V7CjO41BS4LC5AJVea4gTGrCi2UpFFNMwTop8942dl+58hfMZhYLX0j\n2wHKOOQaGBTOl8BCAyblxcwpqFX7IWWPgdr9/9bRG1xDEE67wJHE3GBVmu6JuXtq\nPhomKbRpuLagjO5A5yBwaF79GQY1AgMBAAECgYEAh4eXG9szDS+Ge4SUtQclkClM\ngVMv10hn1azESghZ/1kQcM1iw9rX5pR/fhnqBeHWkbmAmBYufzmOSPQmCY5bO/kL\nj/q76OBji2NT4wagvzpdd953OmWudMRdVnDm1QFttS235jT8vcCHA06QPpWyfMUq\n7AOf1jQ7EVFvdQAKLaECQQD53lJA8x90lpOX2TC343kqRKGm3FEN2KXqbO0mlL9a\n1OizTkzgVLjErRwkHQgM+cNqLZy651+xCn2nus4EbmhNAkEA+SKo5J6Ytme77TgF\n+iuYKOCeSZvXChXrPNt6pxEtsS1TcUw5eucHe83ShJXPe51FXLPjskZ80qwQIlxK\n4fqJiQJBAJc2eRa/S0D2Qzm5Aae3bMMsp5tgZ1j2zGnTI62ehTNF99FTSGjWPL8h\neA9O1mlr2VvvYJMnpJxymdqgzT6XRl0CQQCl7O+PVBFharU+yJEyjNZKY08It0IA\n9Zg2b/bATjCgUA/C5YFi2XuiePI8W4pUSepoU2bS1R9NMEuOlulImBQBAkB0kJgt\nQqX8ii9PCOc/DU0f0SFI1Dcal6ov/G7mp94Tx2sYOSjKqfGR0+LjtuZH0XjP+r7F\n1c91Or6pB6N1bXrM\n-----END PRIVATE KEY-----\n'),
(3, '-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANLbQ0/IC697MPYj\nmnYDm0A6STbtu02zLmaNZITc2YIzxIHmRcym/Gg3TWXYAFAXB+8nw/xYTMrc3Q4S\nB6yMyo+Y3+K8FUvShX5ai/oZJkTFPdWma5ZLgaJtS13Tz/6ZDBgNKYchI9GFU9TZ\n/faOyQy8epv6Y3e9mKcJvwTywyyHAgMBAAECgYBEb8QWJfCdARfwG7gra5o9K23N\n9TUgz/JUeLnSYbf7CYBTRQEMnno3/RMS5hub4w3BMp/qzGIISc05nuJ8v6mSgNvD\n5HSxyOBQQDTgUdL9FLvQ5ZrgUNMhxSXE3tgpF2nsCNd21riKIG7m4R2MqwytYuEH\njf7hAtf6InpuXB07YQJBAPUqbiQhaIB3pjQR/ZouaGwd50BNosK6yAch8hgffCN0\nqZB+4fQj3DRH1nJYlPXY6JkOmP4C89x/8CU9a0XLLHECQQDcLLDZ2aX+lsp778rO\nbsTxblUvqR1ogU6I+Rl0EV6QRfjh1xhNTDPvlfL4o/nJcpjcWWmARvbkAlp1AXOp\ne8R3AkEAo1hm0/nSV63gddb6wgxjlI2D8ysG43lxJpduZrYrjq/+/gAb6f8ui0LF\n1Z/Bd9/ScY/xTWSIOASh6x316CWLcQJAG8wAn+BclqHO+oqxnhJaBukZFCVTsyfw\nFFbuobq3p5tN6qVPSiL+w5a40C9Tj91J8zfOnAVZkjvB09fVFGatzQJAfegHGeRG\njtUdS0ln/PYIgk5yaSqiM+y4xiaxz11bRZHms0/LapLrP8pX8hSjUEm/OFIt+427\n8WygZILm2mXwsQ==\n-----END PRIVATE KEY-----\n'),
(4, '-----BEGIN PRIVATE KEY-----\nMIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKVWRbmBpyPgMkXp\naX9rMHynGmHTiSFVfKvCFrvuwb/R6Fep054ODEryL972qBUfjmcV+lwt66ECfobq\nMv5YzO4xMfKhbgftiepYIpZ+yjeklVzsEIxdT1ZMx0rovsIZYeDnPi4u6w8XcTA4\nPwgd9kPFDDKf4v6cJkO/Snx/v/AzAgMBAAECgYBncUmgXZDf7kYl3XpG4R5t7vKf\noASc2Wpt37nvjNqlk8PlDPi8W5evUEVJH1NcG+kxb9u6znQswW2+JUsQPSjBIJBC\n/7FnetIFrGsKjeMShIhly3UEtUCR0Hal1toukTIEC5GX3WmpH5jaShtBTXodDqXc\nagNH/8PItDBLJRtPsQJBAM5PhqmtwWn5xLAe35fI8zp1xBhR7yX2gurVbLjqbbTb\niM1JnDTOuKGR8fKmgcbDwydYAaRWLpGglu1pzQnnACkCQQDNKHBARb2Rm5HL2PDX\njGsriibdzc9EqZpeA8jjJ01sMcANFWh1QmaSurneC3uXUJrfB5DgYWbjghtty5Yy\nZYj7AkB/LEpoIbFN8CasIfvWBorYCGv+SdNO5WvB8hl4yxkhGQp08OEXNC5feiVY\nXAc3TMjpYbhxYqaGIiWm50b6yagxAkAKe9eIoUe3qiCALzzXdvh/CBdGXF8MHjKi\nPUVFvltpfP1YbdChtVvygZI/84xERj0zynovzSpp09s8+Btbxe6DAkAdxX6jmzHT\nDfzxOUciISV36JOuPJjN6wh9W8b0PQDjznBxERMvM4Cr/jS4T5ucMR3axqQAWwHf\nGZbMB024vq+c\n-----END PRIVATE KEY-----\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`voter_id`);

--
-- Indexes for table `pub`
--
ALTER TABLE `pub`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pub`
--
ALTER TABLE `pub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;